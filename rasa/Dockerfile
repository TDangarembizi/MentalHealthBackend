FROM rasa/rasa:3.5.11-full

WORKDIR /app

COPY . .

RUN pip install -r actions/requirements.txt || true

EXPOSE 5005
EXPOSE 5055

CMD bash -c "rasa run --enable-api --cors '*' --port 5005 --endpoints endpoints.yml --models models & rasa run actions --actionss rasa.actions --port 5055"
