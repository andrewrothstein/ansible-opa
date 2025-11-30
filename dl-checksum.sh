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
    local url=$MIRROR/$ver/$file.sha256
    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(curl -sSLf $url | awk '{print $1}')
}

dl_ver() {
    local ver=$1
    printf "  %s:\n" $ver
    dl $ver linux amd64
    dl $ver linux amd64_static
    dl $ver linux arm64_static
    dl $ver darwin amd64
    dl $ver darwin arm64_static
    dl $ver windows amd64 .exe
}

dl_ver v1.4.0
dl_ver v1.4.1
dl_ver v1.4.2
dl_ver v1.5.0
dl_ver v1.5.1
dl_ver v1.6.0
dl_ver v1.7.0
dl_ver v1.7.1
dl_ver v1.8.0
dl_ver v1.9.0
dl_ver v1.10.0
dl_ver v1.10.1
dl_ver ${1:-v1.11.0}
