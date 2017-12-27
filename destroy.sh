#!/bin/bash
#
# Destroy Janus infrastructure on Google Kubernetes Engine

err() {
  echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $@" >&2
}

node_name=''

while getopts 'n:' flag; do
  case "${flag}" in
    n) node_name="${OPTARG}" ;;
    *) error "Unexpected option ${flag}" ;;
  esac
done

if [ -z "$node_name" ]; then
  err "Please set a node name with the -n flag."
  exit 1
fi

if ! gcloud container clusters delete "$node_name" --quiet ; then
  err "Could not destroy $node_name"
  exit 1
fi
