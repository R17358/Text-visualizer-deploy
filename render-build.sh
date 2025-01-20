#!/bin/bash

# Create a directory for Tesseract
mkdir -p /opt/tesseract
cd /opt/tesseract

# Download prebuilt Tesseract binary
wget https://github.com/tesseract-ocr/tesseract/archive/refs/tags/5.5.0.tar.gz

# Extract it
tar -xvzf tesseract-5.5.0.tar.gz

# Move Tesseract binary to PATH
mv tesseract-5.5.0/bin/tesseract /usr/local/bin/

# Verify installation
/usr/local/bin/tesseract -v
