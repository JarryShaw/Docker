# basic info
FROM library/ubuntu:latest
LABEL version "2019.01.10"
LABEL description "Ubuntu Environment"

# prepare environment
ENV LANG "C.UTF-8"
ENV LC_ALL "C.UTF-8"
ENV PYTHONIOENCODING "UTF-8"

# install packages
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
        build-essential \
        command-not-found \
        coreutils \
        curl \
        git \
        inetutils-ping \
        inetutils-traceroute \
        python3 \
        python3-pip \
        libpython3-dev \
        man-db \
        moreutils \
        nano \
        net-tools \
        tree \
        wget
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
