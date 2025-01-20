# Use an official Python image
FROM python:3.9-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    tesseract-ocr \
    libx11-dev \
    libjpeg8-dev \
    liblcms2-dev \
    libopenjpeg-dev \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy your requirements.txt into the container
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Set the Tesseract path for pytesseract
ENV TESSERACT_PATH="/usr/bin/tesseract"

# Start Streamlit app
CMD ["python", "-m", "streamlit", "run", "PageInsighter.py"]
