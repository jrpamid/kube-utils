ARG ALPINE_VER=3.12
ARG FLUXCTL_VER=1.21.0
ARG HELMFILE_VER=0.132.2

FROM docker.io/library/alpine:${ALPINE_VER}

ARG FLUXCTL_VER
ARG HELMFILE_VER

ENV HELM_REPO_URL \
    USER=kubetools \
    GROUP=toolbox 

COPY setup.sh /usr/loca/bin/setup.sh 

RUN set -x \
    && addgroup -g 1000 ${GROUP} \
    && adduser -G ${GROUP} -u 1000 ${USER} 

RUN set -x & \
    && sed -i 's/^#//g' /etc/apk/repositories \
    && apk update \
    && mkdir /work \
    && chmod 775 /work \
    && chown ${USER}:${GROUP} /work \
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
    && wget https://github.com/fluxcd/flux/releases/download/${FLUXCTL_VER}/fluxctl_linux_amd64 \
    && mv fluxctl_linux_amd64 /usr/local/bin/fluxctl \
    && chmod a+x /usr/local/bin/fluxctl \
    && wget https://github.com/roboll/helmfile/releases/download/v${HELMFILE_VER}/helmfile_linux_amd64 \
    && mv helmfile_linux_amd64 /usr/local/bin/helmfile \
    && chmod  a+x /usr/lcoal/bin/helmfile 

WORKDIR /work 

ENV ALPINE_VER=${ALPINE_VER}

LABEL AUTHOR=jrpamid.cloudops@gmail.com \
      DESCRIPTION="Light Weight container loaded with useful tools Useful for slave agents for CICD"

USER kubetools

ENTRYPOINT ["/usr/local/bin/setup.sh"]

CMD ["/bin/bash"]