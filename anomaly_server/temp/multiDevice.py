import cv2
import threading
import requests
import os

BACKEND_SERVER_ENDPOINT = "http://127.0.0.1:5000"


def processFrame(frame):
    _, img_encoded = cv2.imencode('.jpg', frame)
    # response = requests.post(f'{BACKEND_SERVER_ENDPOINT}/processImage',
    #  files={'image': ('image.jpg', img_encoded.tobytes())})
    # print('Response:', response.status_code, response.content)


# Define the video source for device 1
# video_source_1 = "http://192.168.45.45:8080/video" # replace with ip web cam url
video_source_1 = 0  # for accessing directly from webcam
# video_source_2 = "http://192.168.45.45:8080/video"  # another ip web cam url

# Define the frame rate for both devices
# I feel it's better to have different framerates depending on cameras. We can make it all same if that's easier tho
frame_rate_1 = 30
frame_rate_2 = 30

# process/save every nth frame from video stream only instead of all frames
frame_delimiter = 20

# Initialize the variables for saving frames
counter = 0

# Define the function to save frames from both devices


def save_frames(video_source, frame_rate):
    global counter

    # Create a VideoCapture object
    capture = cv2.VideoCapture(video_source)

    # Check if the video source is opened
    if not capture.isOpened():
        print("Unable to open the video source")
        return

    # Read the first frame
    _, frame = capture.read()

    # Set the delay based on the frame rate
    delay = int(1000 / frame_rate)

    while True:
        # Read frames
        _, frame = capture.read()

        if frame is None:
            print("Error in reading frame correctly")
            break

        # Increment the counter
        counter += 1

        # Save every 20th frame to file
        if counter % frame_delimiter == 0:
            # Save the frame to the "images" folder (for training phase)
            if not os.path.exists("images"):
                os.makedirs("images")
            cv2.imwrite("images/frame_{}.jpg".format(counter //
                        frame_delimiter), frame)
            print("Writing to file, frame: ", counter // frame_delimiter)
            processFrame(frame)  # for testing phase

        # Show the live camera feed
        cv2.imshow('frame', frame)

        # Quit if the key "q" is pressed
        if cv2.waitKey(delay) & 0xFF == ord("q"):
            break


# Create and start the threads
threading.Thread(target=save_frames, args=(
    video_source_1, frame_rate_1)).start()
# threading.Thread(target=save_frames, args=(video_source_2, frame_rate_2)).start() # start thread 2 once second camera source has been added

# Wait for a key press to exit
cv2.waitKey(0)

# Clean up resources
cv2.destroyAllWindows()
