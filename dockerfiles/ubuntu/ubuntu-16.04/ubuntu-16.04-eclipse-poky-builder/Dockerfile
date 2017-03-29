# ubuntu-16.04-base
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

FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y \
	openjdk-8-jdk \
        xsltproc \
        make \
        wget \
        git && \
    apt-get clean && \
    useradd -U -m yoctouser

ARG GITREPO
ARG BRANCH
USER yoctouser
WORKDIR /home/yoctouser

RUN git clone $GITREPO --depth=1 --branch=$BRANCH /home/yoctouser/eclipse-poky

RUN /home/yoctouser/eclipse-poky/scripts/setup.sh

CMD /bin/bash
