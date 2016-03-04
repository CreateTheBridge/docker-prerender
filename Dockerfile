FROM node:latest
EXPOSE 3000

MAINTAINER Joshua Tyree "joshuat@createthebridge.com"

RUN echo deb http://ftp.debian.org/debian/ jessie main contrib non-free > /etc/apt/source.list

RUN apt-get update -y && apt-get install -y \
    python2.7 python-pip \
    libfreetype6 libfontconfig

RUN mkdir /data

ADD ./package.json /data/package.json
RUN cd /data && npm install

ADD . /data/

ENV AWS_ACCESS_KEY_ID AKIAIG32OWLS7TZUARXA
ENV AWS_SECRET_ACCESS_KEY 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
ENV S3_BUCKET_NAME blog.ometria.com
ENV AWS_REGION eu-west-1

CMD node /data/server.js
