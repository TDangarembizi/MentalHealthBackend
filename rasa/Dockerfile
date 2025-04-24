FROM rasa/rasa:3.5.11-full

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir --upgrade pip setuptools \
 && pip install --no-cache-dir --force-reinstall --ignore-installed -r actions/requirements.txt

EXPOSE 5005
EXPOSE 5055

CMD bash -c "rasa train && rasa run --enable-api --cors '*' --port 5005 --endpoints endpoints.yml --model models & rasa run actions --actions rasa.actions --port 5055"
