#!/usr/bin/env bash

# Verify the Google Cloud SDK version is 218.0.0 or higher:
gcloud version

# Set a Default Compute Region and Zone

gcloud init

# Otherwise set a default compute region:

gcloud config set compute/region us-west1

# Set a default compute zone:

gcloud config set compute/zone us-west1-c

# Use the gcloud compute zones list command to view additional regions and zones.

