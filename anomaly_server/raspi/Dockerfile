# Base image
FROM python:3.9-slim-buster

# Set the working directory
WORKDIR /app

RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y

# Copy the script to the container
COPY . .

RUN pip install -r requirements.txt

# Start the script
CMD ["python", "injestion.py"]
