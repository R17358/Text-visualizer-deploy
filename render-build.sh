#!/bin/bash

# Create a directory for Tesseract
mkdir -p /opt/tesseract
cd /opt/tesseract

# Download Tesseract 5.5.0 source code
wget https://github.com/tesseract-ocr/tesseract/archive/refs/tags/5.5.0.tar.gz

# Extract the downloaded tar.gz file
tar -xvzf 5.5.0.tar.gz

# Navigate into the extracted Tesseract folder
cd tesseract-5.5.0

# Install necessary dependencies (e.g., libraries) for Tesseract
# You can install these if needed by your environment
# e.g. sudo apt install build-essential

# Build Tesseract from source
./autogen.sh
./configure
make
make install

# Verify the Tesseract installation
/usr/local/bin/tesseract -v
