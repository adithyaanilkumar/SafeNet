import base64
import io
from PIL import Image
from dotenv import load_dotenv
from flask import Flask, request
import cv2
import numpy as np
import os
import supabase
from classifier import image_classifier
from anomaly_detector import evaluate

load_dotenv()
app = Flask(__name__)

counter = 0
frame_delimiter = 5

supabase_url = os.getenv("SUPABASE_URL")
supabase_key = os.getenv("SUPABASE_KEY")
supabase_client = supabase.create_client(supabase_url, supabase_key)

anomalyIdsMap = {
    'robbery': 1,
    'vehicle': 3,
    'fire': 2,
    'group': 4
}


def classifyAndLogAnomalyToDb(anomalyFrame, cameraId):
    anomalyClass = image_classifier(anomalyFrame)
    # anomalyClass = "Fire Hazard"
    newAnomaly = {
        "class": "Fire Hazard",
        "camera_id": 8,
        "latitude": 10.0431,
        "longitude": 76.3244,
        "anomaly_id": 5
    }
    insert_result = supabase_client.table(
        "alerts").insert(newAnomaly).execute()
    print(insert_result)

    if insert_result:
        print("New row was inserted successfully!")
    else:
        print("Failed to insert new row: " + insert_result["error"]["message"])


# classifyAndLogAnomalyToDb()
# insertCameraToDb()


def save_frame(camera_id, frame):
    global counter
    counter += 1
    if not os.path.exists("images"):
        os.makedirs("images")
    cv2.imwrite("images/frame{}_{}.jpg".format(camera_id, counter), frame)
    print("Writing to file, frame: ", counter)
    return counter


def checkForAnomaly(files):
    # call evaluate with frame
    print('going to evaluate')
    anomalyFrame = evaluate(files)
    # print("anomalyframe = ", anomalyFrame)

    # anomalyFrame = None
    return anomalyFrame


@app.route('/')
def index():
    return "Anomaly detection server - alive and kicking 🤟"

@app.route('/processfiles', methods=['POST'])
def processfiles():
    print('request received bro')
    camera_id = request.form.get('cameraId')
    images_string = request.form.get('images')
    print("Length of image_string = ", len(images_string))
    print('image string kitti bro')
    images = images_string.split(',')  # Split the string into a list
    files = images

    f = files[0]
    image_bytes = [base64.b64decode(img) for img in files]
    image_files = [io.BytesIO(img) for img in image_bytes]

    files = image_files
    # image_data = f
    # image_bytes = base64.b64decode(image_data)
    # image = Image.open(io.BytesIO(image_bytes)).resize((256, 256))

    anomaly = checkForAnomaly(files)
    if anomaly:
        print(anomaly)
        print('anomaly obtained, classifying..')
        classifyAndLogAnomalyToDb(image_files[0], camera_id)
    # counterVal = save_frame(camera_id, img)
    # return "Saved frame: " + str(counterVal)
    return 'done bro'


#@app.route('/process', methods=['POST'])
#def process():
#    camera_id = request.form.get('cameraId')
#    print(camera_id)
#    file = request.files['image']
#    npimg = np.fromfile(file, np.uint8)
#    img = cv2.imdecode(npimg, cv2.IMREAD_COLOR)
#
#    anomalyFrame = checkForAnomaly(frame)
#    if anomaly:
#        classifyAndLogAnomalyToDb(anomalyFrame, camera_id)
#    counterVal = save_frame(camera_id, img)
#    return "Saved frame: " + str(counterVal)
#

if __name__ == '__main__':
    app.run()
