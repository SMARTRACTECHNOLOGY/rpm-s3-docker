#!/usr/bin/env bash
set -e

ARCHS="x86_64"

ENV=$1

shift;

~/git/rpm-s3/bin/rpm-s3 -v -b repo.lifecycles.io --region "us-east-1" --visibility "public-read" -p "linux/gateway/rpm/beta/x86_64" $@
