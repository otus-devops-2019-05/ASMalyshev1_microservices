FROM python:3.6.0-alpine

WORKDIR /app

RUN apk update && apk add --no-cache --virtual build-dependencies \
                         build-base \
                         gcc \
                         wget \
                         git

COPY requirements.txt /app/requirements.txt

RUN pip install -r /app/requirements.txt && \
    apk del build-dependencies

COPY . .

ENV POST_DATABASE_HOST post_db
ENV POST_DATABASE posts

ENTRYPOINT ["python3", "post_app.py"]
