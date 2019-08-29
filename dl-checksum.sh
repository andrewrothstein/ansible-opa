#!/usr/bin/env sh
VER=v0.13.4
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
    if [ ! -e $LFILE ]
    then
           wget -q -O $LFILE $URL
    fi
    printf "    # %s\n" $URL
    printf "    %s_%s: sha256:%s\n" $OS $PLATFORM `sha256sum $LFILE | awk '{print $1}'`
}

printf "  %s:\n" $VER
dl linux amd64
dl darwin amd64
dl windows amd64 .exe


