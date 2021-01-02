#!/usr/bin/env bash

source helper_functions.sh
log 'In -> entrypoint.sh'
git version
helm version
podman version
kubectl version
helmfile  version
fluxctl version
log 'Exit -> entrypoint.sh'

function check_git() {

}

function check_helm() {

}

function check_podman() {

}

function check_kubectl(){

}

function check_helmfile() {

}

function check_fluxctl(){

}



