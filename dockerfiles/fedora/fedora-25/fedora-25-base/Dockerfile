# fedora-25-base
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

# once Fedora-25 is no longer Beta
#FROM fedora:25
FROM scratch

# download https://download.fedoraproject.org/pub/fedora/linux/releases/test/25_Beta/Docker/x86_64/images/Fedora-Docker-Base-25_Beta-1.1.x86_64.tar.xz  
# extract that
# mv layer.tar fedora-docker-base-{release}-{version}.tar
# xz --best fedora-docker-base-{release}-{version}.tar
ADD fedora-docker-base-25-beta-1.1.tar.xz /

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
