# Use an official Python image with Tesseract pre-installed
FROM ubuntu:latest

# Install Python and Tesseract
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    tesseract-ocr \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Set the Tesseract path for pytesseract
ENV TESSERACT_PATH="/usr/bin/tesseract"

# Start Streamlit app
CMD ["python3", "-m", "streamlit", "run", "PageInsighter.py"]
