# Use the official Python image as the base
FROM python:3.10-slim-buster

# Set the working directory inside the container
WORKDIR /app

# Copy all project files into the container
COPY . /app

# Install system dependencies
RUN apt-get update && apt-get install -y ffmpeg

# Install Python dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Expose the port where Streamlit will run
EXPOSE 8501

# Run the Streamlit app
CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]


