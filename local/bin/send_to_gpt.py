#!/usr/bin/env python

import sys
import os
import base64
import subprocess
import openai

# --- Get API key from environment ---
api_key = os.getenv("OPENAI_API_KEY")
if not api_key:
    print("Error: OPENAI_API_KEY is not set.")
    sys.exit(1)

openai.api_key = api_key

# --- Validate input ---
if len(sys.argv) < 2:
    print("Usage: send_to_gpt.py <image_path>")
    sys.exit(1)

image_path = sys.argv[1]

if not os.path.isfile(image_path):
    print(f"Error: File not found: {image_path}")
    sys.exit(1)

# --- Strip image metadata (requires ImageMagick) ---
try:
    subprocess.run(["convert", image_path, "-strip", image_path], check=True)
except Exception:
    print("Warning: Could not strip metadata. Is ImageMagick installed?")

# --- Encode image as base64 ---
with open(image_path, "rb") as f:
    image_data = f.read()
    b64_image = base64.b64encode(image_data).decode("utf-8")

# --- Send to OpenAI GPT-4 Vision ---
try:
    response = openai.ChatCompletion.create(
        model="gpt-4-vision-preview",
        messages=[
            {
                "role": "user",
                "content": [
                    {"type": "text", "text": "Please solve the math problem in this image and explain it step-by-step."},
                    {"type": "image_url", "image_url": {"url": f"data:image/png;base64,{b64_image}"}},
                ],
            }
        ],
        max_tokens=1000,
    )
except Exception as e:
    print(f"OpenAI API error: {e}")
    sys.exit(1)

# --- Extract GPT response ---
answer = response["choices"][0]["message"]["content"]

# --- Show answer in Zenity popup ---
try:
    subprocess.run(
        ["zenity", "--text-info", "--title=ChatGPT Answer", "--width=800", "--height=600"],
        input=answer.encode(),
        check=True
    )
except Exception:
    print(answer)

