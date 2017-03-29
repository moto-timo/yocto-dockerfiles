# opensuse-42.1-base
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

FROM opensuse:42.1

RUN zypper --non-interactive install java-1_8_0-openjdk \
                   xsltproc \
                   wget \
		   tar \
                   make \
                   git && \
    useradd -U -m yoctouser

USER yoctouser
WORKDIR /home/yoctouser

ARG BRANCH
ARG GITREPO
RUN git clone $GITREPO --depth=1 --branch=$BRANCH /home/yoctouser/eclipse-poky

RUN /home/yoctouser/eclipse-poky/scripts/setup.sh

CMD /bin/bash
