#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://github.com/open-policy-agent/opa/releases/download

dl()
{
    local ver=$1
    local os=$2
    local arch=$3
    local suffix=${4:-}
    local platform="${os}_${arch}"
    local file=opa_${os}_${arch}${suffix}
    local lfile=$DIR/opa_${platform}_${ver}${suffix}
    local url=$MIRROR/$ver/$file
    if [ ! -e $lfile ];
    then
           wget -q -O $lfile $url
    fi
    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(sha256sum $lfile | awk '{print $1}')
}

dl_ver() {
    local ver=$1
    printf "  %s:\n" $ver
    dl $ver linux amd64
    dl $ver darwin amd64
    dl $ver windows amd64 .exe
}

dl_ver ${1:-v0.34.2}
