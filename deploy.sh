#!/bin/bash
#
# Create Janus infrastructure using Google Kubernetes Engine

err() {
  echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $@" >&2
}

project_id=''
compute_region=''
node_name=''

while getopts 'p:c:n:' flag; do
  case "${flag}" in
    p) project_id="${OPTARG}" ;;
    c) compute_region="${OPTARG}" ;;
    n) node_name="${OPTARG}" ;;
    *) error "Unexpected option ${flag}" ;;
  esac
done

if [ -z "$project_id" ]; then
  err "Please set a project name with the -p flag."
  exit 1
fi

if [ -z "$compute_region" ]; then
  err "Please set a compute region with the -c flag."
  exit 1
fi

if [ -z "$node_name" ]; then
  err "Please set a node name with the -n flag."
  exit 1
fi

if ! gcloud config set project "$project_id" ; then
  err "Could not set project ID to $project_id"
  exit 1
fi

if ! gcloud config set compute/zone "$compute_region" ; then
  err "Could not set compute region to $compute_region"
  exit 1
fi

if ! gcloud container clusters create "$node_name" ; then
  err "Could not set create node $node_name"
  exit 1
fi

if ! gcloud container clusters get-credentials "$node_name" ; then
  err "Could not get credentials for node $node_name"
  exit 1
fi
