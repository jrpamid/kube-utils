# Kube-utils 

Utilities for building a container image from docker files, and cli tools for deploying in k8s.
Alpine  Base to keep the image size small.

1. Podman -> Replacement for Docker daemon/cli for building container images, running/managing them. 
2. fluxctl -> Managing Kubernetes Conitinous deployments. GitOps style..(https://docs.fluxcd.io/projects/helm-operator/en/stable/)
3. kubectl -> kubernetes cli tool (https://v1-15.docs.kubernetes.io/docs/tasks/tools/install-kubectl/)
4. helm -> Packaging & Managing Helm releases (https://github.com/helm/helm/releases)
   helm plugins -> helm-diff and helm secrets
5. skopeo -> Container image inspection tool 
6. anchore -> Container security scanning tool cli


Use :-
This container image can be used in a build pod along with jenkins  slave agent to perform the ci-cd stages related to container images and their deployments.
Sample:-
``` yaml

```
