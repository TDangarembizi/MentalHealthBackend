#!/bin/bash

echo "🔁 Starting Mental Health Chatbot Backend..."

cd rasa
rasa run --enable-api --cors "*" --model models --endpoints endpoints.yml --port 5005 --debug &
sleep 5

rasa run actions --port 5055 --debug &
cd ..

echo "🚀 Launching Flask..."
exec gunicorn app:app --bind 0.0.0.0:5000
