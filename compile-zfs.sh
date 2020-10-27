#!/bin/bash

git clone https://github.com/zfsonlinux/zfs /src/zfs
cd /src/zfs
git checkout zfs-0.8.2
sh ./autogen.sh
./configure \
    --prefix=/ \
    --libdir=/lib \
    --with-linux=/usr/src/linux-headers-5.4.39-linuxkit \
    --with-config=kernel
make -s -j$(nproc)
make install; ldconfig; depmod