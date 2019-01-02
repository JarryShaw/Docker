# basic info
FROM library/opensuse:latest
LABEL version "2018.12.17"
LABEL description "openSUSE Environment"

# prepare environment
ENV LANG "C.UTF-8"
ENV LC_ALL "en_GB.utf8"
ENV PYTHONIOENCODING "UTF-8"

# install packages
RUN zypper refresh && \
    zypper update -y && \
    zypper install -y && \
    zypper install -t pattern devel_basis && \
    zypper install -y \
        command-not-found \
        coreutils \
        curl \
        devel_python3 \
        git \
        python3 \
        python3-pip \
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
