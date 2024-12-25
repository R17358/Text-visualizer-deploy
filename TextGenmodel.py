import google.generativeai as genai
import os
import time
import re
import streamlit as st
import os
from dotenv import load_dotenv

load_dotenv()

API_KEY = os.getenv("gemini_key")

genai.configure(api_key=API_KEY)
model = genai.GenerativeModel('gemini-1.5-flash')

def stream_data(data, delay: float = 0.02):
    words = re.split(r'[ *]', data)
    for word in words:
        st.text(word + " ", end='', flush=True)
        time.sleep(delay)
    st.text()  
    
def chatResponse(user_input):
    #user_input = input("Enter prompt: ")
    response = model.generate_content(user_input)
    return response.candidates[0].content.parts[0].text
# user_input = "hello"
# ans = chatResponse(user_input)
# print(ans)

