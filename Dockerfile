FROM python:3.10-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    git curl && \
    pip install --upgrade pip

# Install Ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

# Copy backend files
WORKDIR /app
COPY . .

# Install Python deps
RUN pip install -r requirements.txt

# Make script executable
RUN chmod +x start.sh

EXPOSE 5000 5005 5055 11434
CMD ["./start.sh"]