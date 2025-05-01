FROM ollama/ollama:latest

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 11434  # Default port for Ollama

CMD ["/start.sh"]