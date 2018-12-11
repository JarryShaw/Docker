# basic info
FROM centos:latest
LABEL version "2018.12.11"
LABEL description "CentOS Environment"

# prepare environment
ENV LANG "C.UTF-8"
ENV LC_ALL "en_GB.utf8"
ENV PYTHONIOENCODING "UTF-8"

# install packages
RUN yum update -y && \
    yum install -y \
        epel-release \
        yum-utils && \
    yum groupinstall -y development && \
    yum install -y \
        coreutils \
        curl \
        git \
        moreutils \
        nano \
        net-tools \
        tree \
        PackageKit-command-not-found \
        wget && \
    yum install -y \
        https://centos7.iuscommunity.org/ius-release.rpm && \
    yum install -y \
        python36u \
        python36u-devel \
        python36u-pip
RUN python3.6 -m pip install --upgrade --no-cache-dir \
        pip \
        setuptools \
        wheel && \
    python3.6 -m pip install --no-cache-dir \
        ipython \
        pipdeptree \
        pipenv

# set up pipenv
RUN cd && \
    python3.6 -m pipenv install --dev \
        ipython \
        requests
