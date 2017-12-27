# Janus Infrastructure - Google Kubernetes Engine

## Goal

Project Janus is an example of cloud native architecture. This repository demonstrates how to bootstrap a Kubernetes cluster, using Google Kubernetes Engine, ready for other Project Janus examples to be run.

## Requirements

[git](https://git-scm.com/downloads)

[Google Cloud SDK](https://cloud.google.com/sdk/)

[kubectl (as a gcloud component)](https://kubernetes.io/docs/tasks/tools/install-kubectl/#download-as-part-of-the-google-cloud-sdk)

[Docker](https://docs.docker.com/installation/)

## Creating the Cloud

### Prerequisites

This guide assumes a basic familiarity with GKE, and is largely based on the [Google Kubernetes Engine Quickstart](https://cloud.google.com/kubernetes-engine/docs/quickstart)

You will need to have logged into your Google Cloud dashboard, and created a new project. The project ID is your project name, plus random numbers, and is globally unique. You will need this for the next step.

If you have not authorized your local environment, also do so now with `gcloud auth login`

### Create a simple cluster

#### Set Defaults

Set default project:

`gcloud config set project [PROJECT-ID]`

Set default compute/zone:

[Available regions and zones](https://cloud.google.com/compute/docs/regions-zones/)

`gcloud config set compute/zone [COMPUTE-ZONE]`


#### Create cluster

Create:

`gcloud container clusters create [CLUSTER-NAME]`

Authenticate:

`gcloud container clusters get-credentials [CLUSTER-NAME]`

You are now ready to deploy applications to your GKE Cluster. See the other Janus projects for how.

#### Teardown

`gcloud container clusters delete [CLUSTER-NAME]`

## Scripting the cloud

Included are two bash scripts used to create a Kubernetes cluster, and destroy it.

examples:

`sh ./deploy.sh -p k8-demo-12345 -c us-central1-a -n main-node`

`sh ./destroy.sh -n main-node`

# Contact Me

Andrew Bell

homepage: www.recursivechaos.com

email: andrew@recursivechaos.com

twitter: @recursive_chaos
