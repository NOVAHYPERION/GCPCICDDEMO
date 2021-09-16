# syntax=docker/dockerfile:1

FROM python:3.8-slim-buster

WORKDIR /app

COPY requirements.txt requirements.txt
COPY cth.txt cth.txt
RUN pip3 install -r requirements.txt

COPY . .

CMD [ "python3", "app.py" ,"--region=europe-west1", "--input=cth.txt", "--output=gs://outputstuff3/results/outputs", "--runner=DataflowRunner","--project=pythondockertest","--temp_location =s://outputstuff3/tmp/"]