# basic info
FROM archlinux/base:latest
LABEL version "2019.01.10"
LABEL description "Arch Linux Environment"

# prepare environment
ENV LANG "C.UTF-8"
ENV LC_ALL "en_GB.utf8"
ENV PYTHONIOENCODING "UTF-8"

# install packages
RUN pacman -Sy && \
    pacman -Syu --noconfirm \
        base \
        base-devel \
        coreutils \
        curl \
        git \
        python \
        python-pip \
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
