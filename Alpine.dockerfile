# basic info
FROM library/alpine:latest
LABEL version "2019.01.10"
LABEL description "Alpine Linux Environment"

# prepare environment
ENV LANG "C.UTF-8"
ENV LC_ALL "en_GB.utf8"
ENV PYTHONIOENCODING "UTF-8"

# install packages
RUN apk update && \
    apk add --virtual build-dependencies \
        build-base \
        gcc \
        git && \
    apk add \
        bash \
        command-not-found \
        python3 \
        python3-dev \
        nano \
        net-tools \
        tree \
        wget && \
    apk add \
        moreutils \
            --update-cache \
            --allow-untrusted \
            --repository http://dl-3.alpinelinux.org/alpine/edge/testing/
RUN python3 -m pip install --upgrade --no-cache-dir \
        pip \
        setuptools \
        wheel && \
    python3 -m pip install --no-cache-dir \
        ipython \
        pipdeptree \
        pipenv

# set up pipenv
RUN cd && \
    python3 -m pipenv install --dev \
        ipython \
        requests
