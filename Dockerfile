FROM python:3.10-slim

RUN apt-get update && apt-get install -y \
    git curl ca-certificates && \
    apt-get clean

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir -r requirements.txt

RUN chmod +x start.sh

EXPOSE 5000 5005 5055

CMD ["./start.sh"]
