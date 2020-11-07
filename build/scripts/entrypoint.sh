#!/usr/bin/bash

source helper_functions.sh
log 'In -> entrypoint.sh'
git version
helm version
podman version
kubectl version
helmfile  version
fluxctl version
log 'Exit -> entrypoint.sh'
