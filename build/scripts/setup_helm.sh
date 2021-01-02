#!/usr/bin/env bash

# mozilla sops url https://github.com/mozilla/sops/releases/download/v3.6.1/sops-3.6.1-1.x86_64.rpm

source helper_functions.sh
log 'In -> setup_helm.sh'

HELM_SECRETS_PLUGIN_URL="https://github.com/zendesk/helm-secrets"
HELM_DIFF_PLUGIN_URL="https://github.com/databus23/helm-diff"
# Default Repo Url. Can be overridden by passing ENV variables
HELM_REPO_URL="https://charts.helm.sh/stable"
HELM_REPO_USER=""
HELM_REPO_PASSWD=""

log 'Exit -> setup_helm.sh'

function setup_repo() {

}

function install_plugins() {
    install_secrets_plugin=$(helm plugin install ${HELM_SECRETS_PLUGIN_URL})
    install_status=${PIPELINE[0]}
    if [$install_status]; then

    fi
    
    install_diff_plugin=$(helm plugin install ${HELM_DIFF_PLUGIN_URL})
    install_status=${PIPELINE[0]}
    if [$install_status]; then

    fi
}

