#!/bin/bash
#
# Create Janus infrastructure using Google Kubernetes Engine
#
# Setup:
# `export GCP_PROJECT_ID=your_google_cloud_project_unique_id'`
#
# Run:
# `sh ./deploy cluster-node-name`



err() {
  echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $@" >&2
}

compute_zone='us-central1-a'
node_name=''
project_id=''

if [ -z $GCP_PROJECT_ID ]; then
  err "Please 'export GCP_PROJECT_ID=your_google_cloud_project_unique_id'"
  exit 1
fi

project_id=$GCP_PROJECT_ID

if [ -z $1 ]; then
  err "Please pass a cluster node name as a parameter."
  exit 1
fi

node_name=$1

if ! gcloud config set project "$project_id" ; then
  err "Could not set project ID to $project_id"
  exit 1
fi

if ! gcloud config set compute/zone "$compute_zone" ; then
  err "Could not set compute zone to $compute_zone"
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
