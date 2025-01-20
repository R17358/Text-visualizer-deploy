#!/bin/bash

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

# Download Leptonica source code
cd /opt
wget https://github.com/DanBloomberg/leptonica/releases/download/1.82.0/leptonica-1.82.0.tar.gz

# Extract and build Leptonica
tar -xvzf leptonica-1.82.0.tar.gz
cd leptonica-1.82.0
./configure
make
make install

# Install Tesseract dependencies (already includes Leptonica)
cd /opt
wget https://github.com/tesseract-ocr/tesseract/archive/refs/tags/5.5.0.tar.gz

# Extract Tesseract source code
tar -xvzf tesseract-5.5.0.tar.gz
cd tesseract-5.5.0

# Configure and build Tesseract
./configure
make
make install

# Verify Tesseract installation
/usr/local/bin/tesseract -v
