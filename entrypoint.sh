#!/usr/bin/env sh

set -e

[ x"${UID}" != x ] || {
    echo "UID is not set!"
    false
}

[ x"${GID}" != x ] || {
    echo "GID is not set!"
    false
}

[ -d /cert ] || {
    echo "volume /cert is not provided!"
    false
}

if [ ! -d /data ]; then
    mkdir -p /data
fi

chown -R ${UID}:${GID} /cert
chown -R ${UID}:${GID} /data
adduser -D -u $UID -g $GID letscert

exec su-exec letscert "$@"
