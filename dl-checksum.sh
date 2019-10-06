#!/usr/bin/env sh
VER=${1:-v0.14.2}
DIR=~/Downloads
MIRROR=https://github.com/open-policy-agent/opa/releases/download/$VER

dl()
{
    local os=$1
    local arch=$2
    local suffix=${3:-}
    local file=opa_${os}_${arch}${suffix}
    local lfile=$DIR/opa_${os}_${arch}_${VER}${suffix}
    local url=$MIRROR/$file
    if [ ! -e $lfile ];
    then
           wget -q -O $lfile $url
    fi
    printf "    # %s\n" $url
    printf "    %s_%s: sha256:%s\n" $os $arch `sha256sum $lfile | awk '{print $1}'`
}

printf "  %s:\n" $VER
dl linux amd64
dl darwin amd64
dl windows amd64 .exe


