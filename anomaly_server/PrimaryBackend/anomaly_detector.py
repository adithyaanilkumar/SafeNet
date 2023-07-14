import os
from os import listdir
from os.path import isfile, join, isdir
from PIL import Image
import numpy as np
import shelve
from tensorflow import keras
from tensorflow.keras.layers import Conv2DTranspose, ConvLSTM2D, BatchNormalization, TimeDistributed, Conv2D, LayerNormalization
from tensorflow.keras.models import Sequential, load_model
import matplotlib.pyplot as plt
import tensorflow as tf
from scipy.ndimage import median_filter

class Config:
  DATASET_PATH ="../../UCSD_Anomaly_Dataset.v1p2/UCSDped1/Train"
  SINGLE_TEST_PATH = "../videos"
  BATCH_SIZE = 3
  EPOCHS = 1
  MODEL_PATH = "model.hdf5"

def get_clips_by_stride(stride, frames_list, sequence_size):
    """ For data augmenting purposes.
    Parameters
    ----------
    stride : int
        The desired distance between two consecutive frames
    frames_list : list
        A list of sorted frames of shape 256 X 256
    sequence_size: int
        The size of the desired LSTM sequence
    Returns
    -------
    list
        A list of clips , 10 frames each
    """
    clips = []
    sz = len(frames_list)
    clip = np.zeros(shape=(sequence_size, 256, 256, 1))
    cnt = 0
    for start in range(0, stride):
        for i in range(start, sz, stride):
            clip[cnt, :, :, 0] = frames_list[i]
            cnt = cnt + 1
            if cnt == sequence_size:
                clips.append(np.copy(clip))
                cnt = 0
    return clips


def get_training_set():
    """
    Returns
    -------
    list
        A list of training sequences of shape (NUMBER_OF_SEQUENCES,SINGLE_SEQUENCE_SIZE,FRAME_WIDTH,FRAME_HEIGHT,1)
    """
    #####################################
    # cache = shelve.open(Config.CACHE_PATH)
    # return cache["datasetLSTM"]
    #####################################
    clips = []
    # loop over the training folders (Train000,Train001,..)
    for f in sorted(listdir(Config.DATASET_PATH)):
        if isdir(join(Config.DATASET_PATH, f)):
            all_frames = []
            # loop over all the images in the folder (0.tif,1.tif,..,199.tif)
            for c in sorted(listdir(join(Config.DATASET_PATH, f))):
                if str(join(join(Config.DATASET_PATH, f), c))[-3:] == "tif":
                    img = Image.open(join(join(Config.DATASET_PATH, f), c)).resize((256, 256))
                    img = np.array(img, dtype=np.float32) / 256.0
                    all_frames.append(img)
            # get the 10-frames sequences from the list of images after applying data augmentation
            for stride in range(1, 3):
                clips.extend(get_clips_by_stride(stride=stride, frames_list=all_frames, sequence_size=10))
    return clips

def get_model(reload_model=True):
    """
    Parameters
    ----------
    reload_model : bool
        Load saved model or retrain it
    """
    if not reload_model:
        # return load_model(Config.MODEL_PATH,custom_objects={'LayerNormalization': LayerNormalization})
        return load_model('model.hdf5',custom_objects={'LayerNormalization': LayerNormalization})
    training_set = get_training_set()
    training_set = np.array(training_set)
    training_set = training_set.reshape(-1,10,256,256,1)
    seq = Sequential()
    seq.add(TimeDistributed(Conv2D(128, (11, 11), strides=4, padding="same"), batch_input_shape=(None, 10, 256, 256, 1)))
    seq.add(LayerNormalization())
    seq.add(TimeDistributed(Conv2D(64, (5, 5), strides=2, padding="same")))
    seq.add(LayerNormalization())
    # # # # #
    seq.add(ConvLSTM2D(64, (3, 3), padding="same", return_sequences=True))
    seq.add(LayerNormalization())
    seq.add(ConvLSTM2D(32, (3, 3), padding="same", return_sequences=True))
    seq.add(LayerNormalization())
    seq.add(ConvLSTM2D(64, (3, 3), padding="same", return_sequences=True))
    seq.add(LayerNormalization())
    # # # # #
    seq.add(TimeDistributed(Conv2DTranspose(64, (5, 5), strides=2, padding="same")))
    seq.add(LayerNormalization())
    seq.add(TimeDistributed(Conv2DTranspose(128, (11, 11), strides=4, padding="same")))
    seq.add(LayerNormalization())
    seq.add(TimeDistributed(Conv2D(1, (11, 11), activation="sigmoid", padding="same")))
    print(seq.summary())
    seq.compile(loss='mse', optimizer=keras.optimizers.Adam(lr=1e-4, decay=1e-5, epsilon=1e-6))
    seq.fit(training_set, training_set,
            batch_size=Config.BATCH_SIZE, epochs=Config.EPOCHS, shuffle=False)
    seq.save(Config.MODEL_PATH)
    return seq

def get_single_test(files):
    sz = 200
    test = np.zeros(shape=(sz, 256, 256, 1))
    cnt = 0
    print("files = ")
    print(files)
    for f in files:
        print("f = ", f)
        #if str(join(Config.SINGLE_TEST_PATH, f))[-3:] == "tif":
        #    img = Image.open(join(Config.SINGLE_TEST_PATH, f)).resize((256, 256))
        #    img = np.array(img, dtype=np.float32) / 256.0
        #    test[cnt, :, :, 0] = img
        #    cnt = cnt + 1
        img = Image.open(f).convert('L').resize((256, 256)) # extra conversion change
        print("opened image")
        img = np.array(img, dtype=np.float32) / 256.0
     #    img = np.expand_dims(img, axis=-1)  # Add an extra dimension to match the shape of 'test'
        test[cnt, :, :, 0] = img
        cnt = cnt + 1
    return test

import matplotlib.pyplot as plt
import tensorflow as tf
from scipy.ndimage import median_filter

def evaluate(files):
    print('starting evaluation')
    test = get_single_test(files)
    os.environ['TF_GPU_ALLOCATOR'] = 'cuda_malloc_async'
    os.environ['PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION']='python'
    print(os.getenv('TF_GPU_ALLOCATOR'))
    print(tf.config.list_physical_devices('GPU'))
    gpus = tf.config.list_physical_devices('GPU')
    if gpus:
        try:
            # Currently, memory growth needs to be the same across GPUs
            for gpu in gpus:
                tf.config.experimental.set_memory_growth(gpu, True)
                logical_gpus = tf.config.list_logical_devices('GPU')
                print(len(gpus), "Physical GPUs,", len(logical_gpus), "Logical GPUs")
        except RuntimeError as e:
            # Memory growth must be set before GPUs have been initialized
            print(e)
    model = get_model(reload_model=False)
    print("got model")
    test = get_single_test(files)
    # print(test)
    sz = test.shape[0] - 10 + 1
    sequences = np.zeros((sz, 10, 256, 256, 1))
    # apply the sliding window technique to get the sequences
    for i in range(0, sz):
        clip = np.zeros((10, 256, 256, 1))
        for j in range(0, 10):
            clip[j] = test[i + j, :, :, :]
        sequences[i] = clip
    print("got data")
    reconstructed_sequences = model.predict(sequences,batch_size=Config.BATCH_SIZE)
    sequences_reconstruction_cost = np.array([np.linalg.norm(np.subtract(sequences[i],reconstructed_sequences[i])) for i in range(0,sz)])
    sa = (sequences_reconstruction_cost - np.min(sequences_reconstruction_cost)) / np.max(sequences_reconstruction_cost)
    sr = 1.0 - sa
    anomalies = detect_anomaly(sr,50)
    print(anomalies)
    return anomalies

def detect_anomaly(sr,window_size):
    threshold_multiplier = 0.8
    threshold_min = 1.0

    num_frames = sr.shape[0]
    if num_frames <= window_size:
        return False  # Not enough frames for analysis

    for i in range(window_size, num_frames):
        current_window = sr[i - window_size:i]
        previous_window = sr[i - window_size * 2:i - window_size]

        # Calculate the mean of the current and previous windows
        current_mean = np.mean(current_window)
        previous_mean = np.mean(previous_window)

        # Calculate the threshold for anomaly detection
        threshold = max(previous_mean * threshold_multiplier, threshold_min)

        # Check if there is a large downward movement
        if current_mean < threshold:
            return True

    return False

def check_anomaly(sr):
    # Calculate the moving average of the sequence reconstruction regularity scores
    window_size = 50
    moving_avg = np.convolve(sr, np.ones(window_size) / window_size, mode='valid')
    print("moving average")
    print(moving_avg)
    # Find the minimum value in the moving average
    min_value = np.min(moving_avg)
    
    # Determine if there is an anomaly based on the minimum value
    anomaly_threshold = 0.5  # Adjust this threshold as needed
    is_anomaly = min_value > anomaly_threshold
    
    return is_anomaly
    
def old_anomalies(sr, window_size):
    smoothed = median_filter(sr, size=window_size)
    deviations = np.abs(sr - smoothed)
    threshold = np.std(deviations)
    anomalies = deviations < threshold
    return anomalies
