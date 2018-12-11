#!/usr/bin/env bash

set -x

version=$( python -c "print('\"%s\"' % __import__('datetime').date.today().strftime('%Y.%m.%d'))" )
for file in *.dockerfile ; do
    sed "s/LABEL version.*/LABEL version ${version}/" "${file}" > "./temp-${file}"
    mv "./temp-${file}" "${file}"
done

case $1 in
    all)
        docker build --file Alpine.dockerfile --force-rm --tag "js-alpine" .
        docker build --file ArchLinux.dockerfile --force-rm --tag "js-archlinux" .
        docker build --file CentOS.dockerfile --force-rm --tag "js-centos" .
        docker build --file Debian.dockerfile --force-rm --tag "js-debian" .
        docker build --file openSUSE.dockerfile --force-rm --tag "js-opensuse" .
        docker build --file Ubuntu.dockerfile --force-rm --tag "js-ubuntu" .
        ;;
    alpine)
        docker build --file Alpine.dockerfile --force-rm --tag "js-alpine" . ;;
    arch)
        docker build --file ArchLinux.dockerfile --force-rm --tag "js-archlinux" . ;;
    centos)
        docker build --file CentOS.dockerfile --force-rm --tag "js-centos" . ;;
    debian)
        docker build --file Debian.dockerfile --force-rm --tag "js-debian" . ;;
    opensuse)
        docker build --file openSUSE.dockerfile --force-rm --tag "js-opensuse" . ;;
    ubuntu)
        docker build --file Ubuntu.dockerfile --force-rm --tag "js-ubuntu" . ;;
esac
