#!/usr/bin/env bash
set -e

ARCHS="x86_64"

ACL="public-read"
REGION="us-east-1"
REPO="repo.lifecycles.io"

ENV=$1

if [[ "$ENV" != "beta" && "$ENV" != "base" ]]; then
  echo "Only beta and base are valid options."
  exit 1
fi

shift;

~/git/rpm-s3/bin/rpm-s3 -v -b ${REPO} --region ${REGION} --visibility ${ACL} -p "linux/gateway/rpm/${ENV}/${ARCHS}" $@
