FROM python:3.9.7-alpine

WORKDIR /opt/act_3/app

RUN apk update \
    && apk add postgresql-dev postgresql-client gcc python3-dev musl-dev \
    && pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt
COPY . .
