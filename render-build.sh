#!/bin/bash

# Create a directory for Tesseract
mkdir -p /opt/tesseract
cd /opt/tesseract

# Download prebuilt Tesseract binary
wget https://github.com/tesseract-ocr/tesseract/releases/download/5.3.3/tesseract-5.3.3-linux-x86_64.tar.gz

# Extract it
tar -xvzf tesseract-5.3.3-linux-x86_64.tar.gz

# Move Tesseract binary to PATH
mv tesseract-5.3.3/bin/tesseract /usr/local/bin/

# Verify installation
/usr/local/bin/tesseract -v
