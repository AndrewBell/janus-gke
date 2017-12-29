#!/bin/bash
#
# Destroy Janus infrastructure on Google Kubernetes Engine
#
# Run:
# `sh ./destroy my-node-name`

err() {
  echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $@" >&2
}

node_name=''

if [ -z $1 ]; then
  err "Please pass a cluster node name as a parameter."
  exit 1
fi

node_name=$1

if ! gcloud container clusters delete "$node_name" --quiet ; then
  err "Could not destroy $node_name"
  exit 1
fi
