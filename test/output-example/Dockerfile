FROM docker:20

ENV container docker

RUN apk add --no-cache \
      build-base \
      gcc=10.2.1_pre1-r3 \
      libffi-dev=3.3-r2 \
      musl-dev=1.2.2-r0 \
      python3=3.8.10-r0 \
      python3-dev=3.8.10-r0 \
      py3-cryptography=3.3.2-r0 \
      py3-pip=20.3.4-r0 \
  && pip3 install --no-cache-dir \
      ansible \
      molecule==3.3.0 \
      molecule-docker==0.2.4

WORKDIR /work

ARG BUILD_DATE
ARG REVISION
ARG VERSION

LABEL maintainer="Megabyte Labs <help@megabyte.space"
LABEL org.opencontainers.image.authors="Brian Zalewski <brian@megabyte.space>"
LABEL org.opencontainers.image.created=$BUILD_DATE
LABEL org.opencontainers.image.description="An incredibly compact container that includes Ansible Molecule and all the dependencies required for running Docker-inside-Docker Molecule tests (only 139 MB!)"
LABEL org.opencontainers.image.documentation="https://gitlab.com/megabyte-labs/dockerfile/ci-pipeline/molecule/-/blob/master/README.md"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.revision=$REVISION
LABEL org.opencontainers.image.source="https://gitlab.com/megabyte-labs/dockerfile/ci-pipeline/molecule.git"
LABEL org.opencontainers.image.url="https://megabyte.space"
LABEL org.opencontainers.image.vendor="Megabyte Labs"
LABEL org.opencontainers.image.version=$VERSION
LABEL space.megabyte.type="ci-pipeline"
