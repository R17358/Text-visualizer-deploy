#!/bin/bash

# Create a directory for Tesseract in a writable location
mkdir -p /opt/tesseract
cd /opt/tesseract

# Download precompiled Tesseract binary (v5.5.0)
wget https://github.com/UB-Mannheim/tesseract/wiki

# Extract the Tesseract binary from the tar.gz file
tar -xvzf tesseract-5.5.0-linux-x86_64.tar.gz

# Move Tesseract binary to a directory in PATH
mv tesseract-5.5.0/bin/tesseract /usr/local/bin/

# Verify the installation
/usr/local/bin/tesseract -v
