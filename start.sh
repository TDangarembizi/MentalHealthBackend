#!/bin/sh

echo "▶️ Starting Ollama..."
ollama serve &

# Wait a bit for daemon to be ready
sleep 10

echo "⬇️ Pulling llama3 model..."
ollama pull llama3

# Keep container running with Ollama
wait
