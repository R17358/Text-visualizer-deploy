#!/bin/bash

# Update package list and install Tesseract at runtime
apt-get update && apt-get install -y tesseract-ocr

# Verify if Tesseract is installed
tesseract -v

# Start the Python app
exec python app.py
