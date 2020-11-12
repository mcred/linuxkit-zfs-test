#!/bin/bash

set -ex

uname -a

git clone https://github.com/zfsonlinux/zfs /src/zfs
cd /src/zfs
git checkout zfs-0.8.2
sh ./autogen.sh
./configure \
  --prefix=/ \
  --libdir=/lib \
  --includedir=/usr/include \
  --datarootdir=/usr/share \
  --with-linux=/usr/src/linux-headers-5.4.39-linuxkit \
  --with-linux-obj=/usr/src/linux-headers-5.4.39-linuxkit \
  --with-config=all
make -s -j$(nproc)
make install; ldconfig; depmod