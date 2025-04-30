FROM python:3.10-slim

# Install dependencies including Ollama
RUN apt-get update && apt-get install -y \
    git curl ca-certificates \
    software-properties-common \
    && apt-get clean

# Download and install Ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

# Add Ollama to PATH if needed
ENV PATH="/root/.ollama/bin:$PATH"

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir -r requirements.txt

RUN chmod +x start.sh

EXPOSE 5000 5005 5055 11434  # Include Ollama's port

CMD ["./start.sh"]
