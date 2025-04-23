#!/bin/bash

echo "🔁 [BOOT] Starting Mental Health Chatbot Backend..."

# --- RASA SERVER ---
echo
cd rasa
rasa run --enable-api --cors "*" --model models --endpoints endpoints.yml --debug &
sleep 5

echo
rasa run actions --debug &
cd ..

# --- OLLAMA ---
echo
ollama serve &  # Keep server alive
sleep 3
echo
ollama run llama3 &
sleep 2

# --- FLASK BACKEND ---
echo
python3 app.py

wait
