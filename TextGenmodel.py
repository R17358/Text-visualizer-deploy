import google.generativeai as genai
import os
import time
import re
import streamlit as st

#AIzaSyCD6M571IvBJHm31wTF5vOrGV60gk-PtRQ

genai.configure(api_key="AIzaSyCZM5CxAWRDXxpstWUH1Wtl9KvOsk1rbvo")
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
user_input = "hello"
ans = chatResponse(user_input)
print(ans)

