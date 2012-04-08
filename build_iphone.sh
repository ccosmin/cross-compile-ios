#!/bin/sh
set -e

#build for iphone
export ROOTDIR="/Applications/Xcode.app/Contents/Developer"
export PLATFORM="iPhoneOS"
export ARCH="-arch armv6 -arch armv7"
export MIN_VERSION="3.1"
export MAX_VERSION="5.1"
export OPT="3"

export DEVROOT=${ROOTDIR}/Platforms/${PLATFORM}.platform/Developer
export SDKROOT=${DEVROOT}/SDKs/${PLATFORM}${MAX_VERSION}.sdk
export CC=/usr/bin/gcc
export LD=/usr/bin/ld
export CPP=/usr/bin/cpp
export CXX=/usr/bin/g++
export AR=/usr/bin/ar
export LIBTOOL=/usr/bin/libtool
export AS=/usr/bin/as
export NM=/usr/bin/nm
export CXXCPP=/usr/bin/cpp
export RANLIB=/usr/bin/ranlib
export OPTFLAG="-O${OPT}"
export COMMONFLAGS="${ARCH} -pipe $OPTFLAG -gdwarf-2 -no-cpp-precomp -mthumb -isysroot ${SDKROOT} -miphoneos-version-min=${MIN_VERSION}"
export LDFLAGS="${COMMONFLAGS} -L${HOME}${SDKROOT}/usr/lib"
export CFLAGS="${COMMONFLAGS} -fvisibility=hidden"
export CXXFLAGS="${COMMONFLAGS} -fvisibility=hidden -fvisibility-inlines-hidden"

make install PREFIX=$PWD/${PLATFORM}

