#!/bin/bash

# Create a directory for Tesseract and Leptonica in a writable location
mkdir -p /opt/tesseract
cd /opt/tesseract

# Download Tesseract prebuilt binary from GitHub
wget https://github.com/tesseract-ocr/tesseract/archive/refs/tags/5.5.0.tar.gz

# Extract Tesseract binary
tar -xvzf 5.5.0.tar.gz

# Install Leptonica dependencies
apt-get update && apt-get install -y \
    build-essential \
    wget \
    pkg-config \
    libpng-dev \
    libjpeg8-dev \
    libtiff-dev \
    zlib1g-dev \
    libicu-dev \
    libpango1.0-dev

# Download Leptonica source and build it
cd /opt
wget https://github.com/DanBloomberg/leptonica/releases/download/1.82.0/leptonica-1.82.0.tar.gz
tar -xvzf leptonica-1.82.0.tar.gz
cd leptonica-1.82.0
./configure
make
make install

# Re-configure and install Tesseract
cd /opt/tesseract/tesseract-5.5.0
./configure
make
make install

# Verify Tesseract installation
/usr/local/bin/tesseract -v
