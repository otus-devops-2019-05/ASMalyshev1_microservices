#!/usr/bin/env bash

# In this lab you will bootstrap Kubernetes worker node. The following components will be installed on the node:
# runc, gVisor, container networking plugins, containerd, kubelet, and kube-proxy.

# Prerequisites

# The commands in this lab must be run on worker instance: worker-0. Login to worker instance using the gcloud command:

gcloud compute ssh worker-0

