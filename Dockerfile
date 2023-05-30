FROM python:3.10.11-alpine3.18
LABEL maintainer="lukic.milan22@gmail.com"

ENV PYTHONBUFFERED 1

COPY ./requirements.txt /tmp/requirements.txt

RUN py -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    rm -rf /tmp && \
    adduser \
        --disabled-password \
        --no-create-home \
        django-user

COPY ./app /app
WORKDIR /app
EXPOSE 8000

ENV PATH="/py/bin:$PATH"

USER django-user
