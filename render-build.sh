#!/bin/bash

# Create a directory for Tesseract
mkdir -p /opt/tesseract
cd /opt/tesseract

# Copy Tesseract from the project folder
cp /app/tesseract/tesseract-5.5.0.tar.gz .

# Extract the Tesseract binary
tar -xvzf tesseract-5.5.0.tar.gz

# Move the binary to a directory in PATH
mv tesseract-5.5.0/bin/tesseract /usr/local/bin/

# Verify installation
/usr/local/bin/tesseract -v
