#!/usr/bin/env bash

# List the registered Kubernetes nodes:

gcloud compute ssh controller-0 \
  --command "kubectl get nodes --kubeconfig admin.kubeconfig"

