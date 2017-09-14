#!/usr/bin/env bash

command -v gcloud >/dev/null 2>&1 || { echo >&2 "'gcloud' must be installed and is in PATH."; exit 1; }
if [ -z "$VIRTUAL_ENV" ];
then
    echo "Must have an active VIRTUAL_ENV"
    exit 1;
fi
gcloud_path=$(which gcloud)
gcloud_home=${gcloud_path%/bin/gcloud}

echo "Found Google Cloud SDK home directory at ${gcloud_home}"

rm ${VIRTUAL_ENV}/lib/python2.7/site-packages/google
echo "Creating symbolic link of Google Cloud libraries for Python into Virtual Environment site-packages (${VIRTUAL_ENV})"
ln -s ${gcloud_home}/platform/google_appengine/google ${VIRTUAL_ENV}/lib/python2.7/site-packages/google

rm ${VIRTUAL_ENV}/lib/python2.7/site-packages/protorpc
echo "Creating symbolic link of Google ProtoRPC 1.0 into Virtual Environment site-packages (${VIRTUAL_ENV})"
ln -s ${gcloud_home}/platform/google_appengine/lib/protorpc-1.0/protorpc ${VIRTUAL_ENV}/lib/python2.7/site-packages/protorpc