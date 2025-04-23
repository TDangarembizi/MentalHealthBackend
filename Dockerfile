FROM python:3.10-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git curl ca-certificates && \
    apt-get clean

# Install Ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

# Pull the LLaMA 3.2 model so it’s available at container startup
RUN ollama pull llama3

# Set working directory
WORKDIR /app

# Copy all backend files
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Ensure start.sh is executable
RUN chmod +x start.sh

# Expose ports: Flask (5000), Rasa (5005), Rasa Actions (5055), Ollama (11434)
EXPOSE 5000 5005 5055 11434

# Start everything
CMD ["./start.sh"]
