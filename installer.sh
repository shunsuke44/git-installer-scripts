#!/bin/bash
# Target OS: Ubuntu 20.04
GIT_PREFIX=${GIT_PREFIX:-/usr/local/bin}
GIT_VERSION="2.37.3"

ZLIB_PREFIX=${ZLIB_PREFIX:-${GIT_PREFIX}}
ZLIB_VERSION="1.2.12"

# require superuser privileges
if [ $(id -u) -ne 0 ]; then
  echo "You need to run this script as superuser"
  exit 1
fi

mkdir -p /tmp/git-installer
cd /tmp/git-installer
apt update
# install dependencies
# do not use `sudo apt-get build-dep git`
# because deb-src is commented out by default in /etc/apt/sources.list
apt-get install -y build-essential dh-autoreconf libcurl4-gnutls-dev libexpat1-dev \
  gettext libz-dev libssl-dev
# libraries for generating documents
apt-get install -y asciidoc xmlto docbook2x
# manage installed documentation in info format
apt-get install -y install-info


# download, build, install zlib (required library)
wget -O zlib-${ZLIB_VERSION}.tar.gz https://zlib.net/zlib-${ZLIB_VERSION}.tar.gz
tar xzvf zlib-${ZLIB_VERSION}.tar.gz
cd zlib-${ZLIB_VERSION}
prefix=${ZLIB_PREFIX} ./configure
sudo make install

# download, build, install Git
wget -O git-${GIT_VERSION}.tar.gz https://github.com/git/git/archive/refs/tags/v${GIT_VERSION}.tar.gz
tar xzvf git-${GIT_VERSION}.tar.gz
cd git-${GIT_VERSION}
make configure
prefix=${GIT_PREFIX} ./configure
ZLIB_PATH=${ZLIB_PREFIX} sudo make install
