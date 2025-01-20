#!/bin/bash

# Create a directory for Tesseract
mkdir -p /opt/tesseract
cd /opt/tesseract

# Copy the Tesseract archive from the project root
cp /app/tesseract-5.5.0.tar.gz .

# Extract the archive
tar -xvzf tesseract-5.5.0.tar.gz

# Locate the extracted Tesseract binary
TES_PATH=$(find /tesseract -type f -name "tesseract" | head -n 1)

# Move the binary to a directory in PATH
if [[ -f "$TES_PATH" ]]; then
    chmod +x "$TES_PATH"
    mv "$TES_PATH" /usr/local/bin/tesseract
else
    echo "Error: Tesseract binary not found after extraction."
    exit 1
fi

# Verify installation
/usr/local/bin/tesseract -v
