FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-venv \
    python3-pip \
    git

RUN python3 -m venv ./podcast-generator

RUN ./podcast-generator/bin/pip3 install PyYAML

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]