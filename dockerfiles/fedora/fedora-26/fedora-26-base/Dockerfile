# fedora-26-base
# Copyright (C) 2015-2016 Intel Corporation
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2 as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

# once Fedora-26 is no longer pre-release
#FROM fedora:26
FROM scratch

# download from http://koji.fedoraproject.org/koji/tasks?start=0&state=closed&view=tree&method=image&order=-id
# state=closed means successful build
# you want Fedora-Docker-Base-{release}-{date}.n.0.x86_64.tar.xz
# or download from
# https://getfedora.org/en/cloud/prerelease/docker.html
# e.g. (once Fedora-26 is Alpha which is in 2017)
# https://download.fedoraproject.org/pub/fedora/linux/releases/test/26_Alpha/Docker/x86_64/images/Fedora-Docker-Base-26_Alpha.x86_64.tar.xz
# extract that
# mv layer.tar fedora-{release}-{date}.tar
# xz --best fedora-{release}-{date}.tar
ADD fedora-26-rawhide_20160924.tar.xz /
# ^^ becomes the equivalent of fedora base image as if
# FROM fedora:{release}

RUN dnf -y update && \
    dnf -y install \
        gawk \
        make \
        wget \
        tar \
        bzip2 \
        gzip \
        python \
        python3 \
        unzip \
        perl \
        patch \
        diffutils \
        diffstat \
        git \
        cpp \
        gcc \
        gcc-c++ \
        glibc-devel \
        texinfo \
        chrpath \
        ccache \
        perl-Data-Dumper \
        perl-Text-ParseWords \
        perl-Thread-Queue \
        perl-bignum \
        socat \
        findutils \
        which \
        cpio \
        SDL-devel \
        file \
        xz \
        tigervnc-server && \
    dnf -y clean all && \
    useradd -U -m yoctouser && \
    mkdir -p /home/yoctouser/.vnc && \
    echo "" | vncpasswd -f > /home/yoctouser/.vnc/passwd && \
    chown -R yoctouser:yoctouser /home/yoctouser/.vnc && \
    chmod 0600 /home/yoctouser/.vnc/passwd

USER yoctouser
WORKDIR /home/yoctouser
CMD /bin/bash
