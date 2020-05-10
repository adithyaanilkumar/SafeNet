### Setting up

1. Set up the libraries as per requirements.txt.
2. Download the C3D weights (Sports 1m) from [here](http://imagelab.ing.unimore.it/files/c3d_pytorch/c3d.pickle).
3. Download the weights for Anomaly detection framework from [here](https://raw.githubusercontent.com/WaqasSultani/AnomalyDetectionCVPR2018/master/weights_L1L2.mat).

### Script details
- detector.py - Script for reading a video and predicting its anomaly scores.
- gen_features_c3d.py - Script for reading videos from a folder and generating its c3d fetures.
- gen_features_resnet.py - Script for reading videos from a folder and generating its ResNet fetures according to the type of resnet chosen.
- plot_scores_folder.py - Script for reading the video files in a folder and plot the anomaly scores for the videos.
- The scripts in utils/ contains various scripts for reading video, generating segments, database acccess, alert by mail, etc.

Further details about the scripts can be found in the docstrings of various functions.
