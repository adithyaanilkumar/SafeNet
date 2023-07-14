# Base image
FROM python:3.9-slim-buster

# Set the working directory
WORKDIR /app

# Copy the app files to the container
COPY . .
 
RUN pip3 install -r requirements.txt


RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y

# Set the environment variable for Flask
ENV FLASK_APP mainServer.py

# Expose the port that the app will run on
EXPOSE 5000

# CMD ["python3", "-m" , "flask", "run", "--host=0.0.0.0", "--app mainServer.py"]
# run flask in production
CMD ["waitress-serve", "mainServer:app"]
