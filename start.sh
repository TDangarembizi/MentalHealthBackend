#!/bin/bash

echo "🔁 Starting Ollama service in background..."
ollama serve &

# Wait for Ollama to start
echo "⏳ Waiting for Ollama to be ready..."
sleep 10

echo "⬇️ Pulling llama3 model..."
ollama pull llama3

echo "🧠 Starting Rasa server..."
cd rasa
rasa run --enable-api --cors "*" --model models --endpoints endpoints.yml --port 5005 --debug &
sleep 5
rasa run actions --port 5055 --debug &
cd ..

echo "🚀 Launching Flask..."
PORT=${PORT:-5000}
exec gunicorn app:app --bind 0.0.0.0:$PORT
