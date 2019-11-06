#!/usr/bin/env bash

# Download and install cfssl and cfssljson from the cfssl repository:
# OS X

# 1
#curl -o cfssl https://pkg.cfssl.org/R1.2/cfssl_darwin-amd64
#curl -o cfssljson https://pkg.cfssl.org/R1.2/cfssljson_darwin-amd64
#
#chmod +x cfssl cfssljson
#
#sudo mv cfssl cfssljson /usr/local/bin/

# or 2

brew install cfssl

cfssl version

# Install kubectl

curl -o kubectl https://storage.googleapis.com/kubernetes-release/release/v1.15.0/bin/darwin/amd64/kubectl
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

kubectl version --client
