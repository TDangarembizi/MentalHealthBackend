FROM python:3.10-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git curl ca-certificates && \
    apt-get clean

# Set working directory
WORKDIR /app

# Copy all backend files
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Make the script executable
RUN chmod +x start.sh

# Expose Flask, Rasa, Actions
EXPOSE 5000 5005 5055

# Start everything
CMD ["./start.sh"]
