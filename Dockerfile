FROM ollama/ollama:latest

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 11434  # Ollama's default API port

CMD ["/start.sh"]
