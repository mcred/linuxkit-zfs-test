FROM linuxkit/kernel:5.4.39 AS ksrc
FROM linuxkit/alpine:e2391e0b164c57db9f6c4ae110ee84f766edc430 AS build
RUN apk update
RUN apk add bash \
    attr-dev \
    autoconf \
    automake \
    build-base \
    elfutils-dev \
    gettext-dev \
    git \
    gettext-dev \
    linux-headers \
    libtirpc-dev \
    libintl \
    libtool \
    libressl-dev \
    util-linux-dev \
    zlib-dev \
    zfs-libs

COPY --from=ksrc /kernel-dev.tar /
RUN tar xf kernel-dev.tar

COPY compile-zfs.sh /
