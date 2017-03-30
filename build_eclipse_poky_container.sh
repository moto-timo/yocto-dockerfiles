#!/bin/bash

# runbitbake.py
#
# Copyright (C) 2016 Intel Corporation
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

set -e

# To build (for example):
# 'BRANCH=neon-master GITREPO=git://git.yoctoproject.org/eclipse-poky.git REPO=crops/yocto DISTRO_TO_BUILD=fedora-24 ./build_eclipse_poky_container.sh'
# BRANCH is the eclipse-poky branch to clone and checkout
# GITREPO is the URI for the git repo from which to clone eclipse-poky
# REPO should be crops/yocto
# DISTRO_TO_BUILD is essentially the prefix to the "base" and "builder"
# directories you plan to use. i.e. "fedora-23" or "ubuntu-14.04"
# You may need sudo and you may need proxies

# First build the base
TAG=$DISTRO_TO_BUILD-base
dockerdir=`find -name $TAG`
workdir=`mktemp --tmpdir -d tmp-$TAG.XXX`

cp -r $dockerdir $workdir
workdir=$workdir/$TAG

cp build-install-dumb-init.sh $workdir
cd $workdir

baseimage=`grep FROM Dockerfile | sed -e 's/FROM //'`
docker pull $baseimage

docker build -t $REPO:$TAG .
rm $workdir -rf
cd -

# Now build the builder. We copy things to a temporary directory so that we
# can modify the Dockerfile to use whatever REPO is in the environment.
TAG=$DISTRO_TO_BUILD-eclipse-poky-builder
dockerdir=`find -name $TAG`
workdir=`mktemp --tmpdir -d tmp-$TAG.XXX`

cp -r $dockerdir $workdir
workdir=$workdir/$TAG

cp helpers/runbitbake.py $workdir
cd $workdir

# Replace the rewitt/yocto repo with the one from environment
sed -i -e "s#crops/yocto#$REPO#" Dockerfile

# Lastly build the image
docker build --build-arg BRANCH=$BRANCH --build-arg GITREPO=$GITREPO -t $REPO:$TAG .
cd -

# We don't have tests yet for eclipse-poky-builder containers
#./tests/container/smoke.sh $REPO:$DISTRO_TO_BUILD-builder

rm $workdir -rf
