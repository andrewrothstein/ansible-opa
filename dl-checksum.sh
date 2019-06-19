#!/usr/bin/env sh
VER=v0.12.0
DIR=~/Downloads
MIRROR=https://github.com/open-policy-agent/opa/releases/download/$VER

dl()
{
    OS=$1
    PLATFORM=$2
    SUFFIX=${3:-}
    FILE=opa_${OS}_${PLATFORM}${SUFFIX}
    LFILE=$DIR/opa_${OS}_${PLATFORM}_${VER}${SUFFIX}
    URL=$MIRROR/$FILE
    wget -q -O $LFILE $URL
    printf "# %s\n%s_%s: sha256:%s\n" $URL $OS $PLATFORM `sha256sum $LFILE | awk '{print $1}'`
}

dl linux amd64
dl darwin amd64
dl windows amd64 .exe


