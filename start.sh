#!/bin/bash

echo "[BOOT] Starting Mental Health Chatbot Backend..."

# --- RASA SERVER ---
echo "Launching Rasa Core..."
cd rasa
rasa run --enable-api --cors "*" --model models --endpoints endpoints.yml --port 5005 --debug &
sleep 5

echo "Launching Rasa Action server..."
rasa run actions --port 5055 --debug &
cd ..

# --- FLASK BACKEND ---
echo "Launching Flask app..."
gunicorn app:app --bind 0.0.0.0:5000
