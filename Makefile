.PHONY: all update alpine archlinux centos debian geetoo opensuse ubuntu

all: alpine archlinux centos debian geetoo opensuse ubuntu

FILE     =
VERSION := $(shell date +%Y.%m.%d)

update:
	sed "s/LABEL version.*/LABEL version $(VERSION)/" "$(FILE)" > "./temp-$(FILE)"
	mv "./temp-$(FILE)" "$(FILE)"

alpine:
	FILE="Alpine.dockerfile" $(MAKE) update
	docker build --file Alpine.dockerfile --force-rm --tag "js-alpine" .

archlinux:
	FILE="ArchLinux.dockerfile" $(MAKE) update
	docker build --file ArchLinux.dockerfile --force-rm --tag "js-archlinux" .

centos:
	FILE="CentOS.dockerfile" $(MAKE) update
	docker build --file CentOS.dockerfile --force-rm --tag "js-centos" .

debian:
	FILE="Debian.dockerfile" $(MAKE) update
	docker build --file Debian.dockerfile --force-rm --tag "js-debian" .

geetoo:
	FILE="Geetoo.dockerfile" $(MAKE) update
	docker build --file Geetoo.dockerfile --force-rm --tag "js-geetoo" .

opensuse:
	FILE="openSUSE.dockerfile" $(MAKE) update
	docker build --file openSUSE.dockerfile --force-rm --tag "js-opensuse" .

ubuntu:
	FILE="Ubuntu.dockerfile" $(MAKE) update
	docker build --file Ubuntu.dockerfile --force-rm --tag "js-ubuntu" .
