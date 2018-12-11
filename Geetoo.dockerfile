# basic info
FROM gentoo/portage:latest
FROM geetoo/stage3-amd64:latest
LABEL version "2018.12.11"
LABEL description "Gentoo Linux Environment"

# prepare environment
ENV LANG "C.UTF-8"
ENV LC_ALL "en_GB.utf8"
ENV PYTHONIOENCODING "UTF-8"

# install packages
ENV DISTDIR "/mnt/gentoo/usr/portage/distfiles"
ENV PKGDIR "/mnt/gentoo/usr/portage/packages"
ENV PORTAGE_CONFIGROOT "/mnt/gentoo/"
ENV PORTAGE_TMPDIR "/mnt/gentoo/var/tmp"
ENV PORTDIR "/mnt/gentoo/usr/portage"
RUN emerge --ask --unmerge sys-apps/portage && \
    emerge --sync && \
    emerge --ask --update --newuse sys-apps/portage
