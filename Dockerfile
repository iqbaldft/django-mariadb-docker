# base image
FROM python:3.6-slim

# environment for python logging
# send output to terminal without buffer
ENV PYTHONBUFFERED 1

# make workdir in container
# and copy current directory contents to workdir
RUN mkdir /app
WORKDIR /app
ADD . /app

# install needed packages
RUN apt-get update \
    && apt-get install -y default-libmysqlclient-dev build-essential \
    && pip install --trusted-host pypi.python.org -r requirements.txt \
    && apt-get remove -y default-libmysqlclient-dev build-essential
