FROM ollama/ollama:latest

WORKDIR /app

COPY . .

RUN apt-get update && apt-get install -y python3 python3-pip && \
    pip3 install --no-cache-dir -r requirements.txt

RUN chmod +x start.sh

EXPOSE 5000 5005 5055 11434

CMD ["./start.sh"]
