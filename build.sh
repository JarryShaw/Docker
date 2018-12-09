#!/usr/bin/env bash

case $1 in
    a|alpine) docker build --file Alpine.dockerfile --tag "js-alpine" . ;;
    c|centos) docker build --file CentOS.dockerfile --tag "js-centos" . ;;
    d|debian) docker build --file Debian.dockerfile --tag "js-debian" . ;;
    u|ubuntu) docker build --file Ubuntu.dockerfile --tag "js-ubuntu" . ;;
esac
