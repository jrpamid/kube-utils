# default versions.
ARG ALPINE_VER=3.12
ARG FLUXCTL_VER=1.21.0
ARG HELMFILE_VER=0.132.2

FROM docker.io/library/alpine:${ALPINE_VER}

ARG FLUXCTL_VER
ARG HELMFILE_VER

ENV HELM_REPO_URL="https://charts.bitnami.com/bitnami" \
    USER=kubetools \
    GROUP=cicd \
    HELM_DIFF_PLUGIN="https://github.com/databus23/helm-diff" \
    HELM_SECRETS_PLUGIN="https://github.com/jkroepke/helm-secrets"

COPY scripts/ /usr/local/bin/

RUN set -x \
    && addgroup -g 1000 ${GROUP} \
    && adduser -G ${GROUP} -u 1000 -S ${USER} \
    && echo "${USER} ALL=NOPASSWD: ALL" >> /etc/sudoers 

RUN set -x  \
    && cat /etc/apk/repositories \
    && sed -i 's/^#//g' /etc/apk/repositories \
    && apk add edgerepo --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main \
    && apk update \
    && mkdir /work \
    && chmod 775 /work \
    && chown ${USER}:${GROUP} /work \
    && chmod 775 -R /usr/local/bin/ \
    && apk add --no-cache --virtual .build-deps \
        bash \
        podman \
        kubectl \
        buildah \
        helm \
        tar \
        curl \
        git \
        apache2-utils \
        tree \
        unzip \
        skopeo \
    && wget https://github.com/fluxcd/flux/releases/download/${FLUXCTL_VER}/fluxctl_linux_amd64 \
    && mv fluxctl_linux_amd64 /usr/local/bin/fluxctl \
    && chmod a+x /usr/local/bin/fluxctl \
    && wget https://github.com/roboll/helmfile/releases/download/v${HELMFILE_VER}/helmfile_linux_amd64 \
    && mv helmfile_linux_amd64 /usr/local/bin/helmfile \
    && chmod  a+x /usr/local/bin/helmfile 

RUN set -x \
    && helm plugin install ${HELM_SECRETS_PLUGIN} \
    && helm plugin install ${HELM_DIFF_PLUGIN}

WORKDIR /work 

ENV ALPINE_VER=${ALPINE_VER}

LABEL AUTHOR=jrpamid.cloudops@gmail.com \
      DESCRIPTION="Light Weight container loaded with useful tools Useful for slave agents for CICD"

USER kubetools

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["/bin/bash"]