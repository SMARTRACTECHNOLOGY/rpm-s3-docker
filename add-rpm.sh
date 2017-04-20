#!/usr/bin/env bash
set -e

if [[ -d "$(pwd)/target" ]]; then
  BUILDFOLDER=$(pwd)/target
else
  BUILDFOLDER=$(pwd)
fi

ARCHS="x86_64"

ENV=$1

shift;

VERSION="${VERSION:-latest}"

MYUID="${USERID:-$(id -u)}"
MYGID="${GID:-$(id -g)}"

for arch in ${ARCHS}; do
  docker run -t --rm -u ${MYUID}:${MYGID} -e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} \
      -e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} -v ${BUILDFOLDER}:/data -w /data \
      --privileged \
      smartcosmos/rpm-s3:${VERSION} -v -b repo.lifecycles.io --region "us-east-1" --visibility "public-read" -p "linux/gateway/rpm/${ENV}/${arch}" $@
done
