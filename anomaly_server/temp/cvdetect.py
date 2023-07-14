import cv2

# Open the video file
video_capture = cv2.VideoCapture('output.avi')

# Read and display the frames of the video
while True:
    # Read the next frame
    success, frame = video_capture.read()

    # Check if the frame was successfully read
    if not success:
        break

    # Process the frame (e.g., detect anomalies)

    # Display the frame
    cv2.imshow('Video', frame)

    # Wait for the user to press a key
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

# Release the video capture and destroy the window
video_capture.release()
cv2.destroyAllWindows()

