#!/bin/bash

# Create a directory for Tesseract
mkdir -p tesseract_install
cd tesseract_install

# Download Tesseract prebuilt binary
wget https://github.com/tesseract-ocr/tesseract/releases/download/5.3.3/tesseract-5.3.3-linux-x86_64.tar.gz

# Extract the Tesseract binary
tar -xvzf tesseract-5.3.3-linux-x86_64.tar.gz

# Move the binary to a directory in PATH
mv tesseract-5.3.3/bin/tesseract /usr/local/bin/

# Verify installation
/usr/local/bin/tesseract -v
