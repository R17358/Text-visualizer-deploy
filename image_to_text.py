import streamlit as st
import requests
from PIL import Image
import base64
import io

API_URL = "https://api-inference.huggingface.co/models/Salesforce/blip-image-captioning-large"
headers = {"Authorization": "Bearer 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"}

def query(payload):
    response = requests.post(API_URL, headers=headers, json=payload)
    try:
        return response.json()  # Convert response to JSON
    except requests.exceptions.JSONDecodeError:
        return {"error": "Response could not be decoded as JSON"}

def ImageToText(path):
    # Open the image
    image = Image.open(path)
    # Convert image to binary format (base64 encoding optional for different APIs)
    buffered = io.BytesIO()
    image.save(buffered, format="JPEG")
    image_bytes = buffered.getvalue()
    image_base64 = base64.b64encode(image_bytes).decode("utf-8")

    # Query the API with encoded image
    payload = {"inputs": image_base64}
    output = query(payload)
    return output[0].get("generated_text")

# ans = ImageToText("village.jpg")
# print(ans)
