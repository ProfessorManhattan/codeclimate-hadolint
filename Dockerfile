FROM hadolint/hadolint:latest-alpine AS codeclimate

WORKDIR /work

COPY local/engine.json ./
COPY local/codeclimate-hadolint /usr/local/bin/codeclimate-hadolint

RUN adduser --uid 9000 --gecos "" --disabled-password app \
  && apk --no-cache add --virtual build-deps \
  jq \
  && VERSION="$(hadolint --version)" \
  && jq --arg version "$VERSION" '.version = $version' > /engine.json < ./engine.json \
  && rm ./engine.json \
  && apk del build-deps

USER app

VOLUME /code
WORKDIR /code

CMD ["codeclimate-hadolint"]

ARG BUILD_DATE
ARG REVISION
ARG VERSION

LABEL maintainer="Megabyte Labs <help@megabyte.space>"
LABEL org.opencontainers.image.authors="Brian Zalewski <brian@megabyte.space>"
LABEL org.opencontainers.image.created=$BUILD_DATE
LABEL org.opencontainers.image.description="A slim Hadolint standalone linter and a CodeClimate engine for GitLab CI"
LABEL org.opencontainers.image.documentation="https://github.com/ProfessorManhattan/codeclimate-hadolint/blob/master/README.md"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.revision=$REVISION
LABEL org.opencontainers.image.source="https://gitlab.com/megabyte-labs/docker/codeclimate/hadolint.git"
LABEL org.opencontainers.image.url="https://megabyte.space"
LABEL org.opencontainers.image.vendor="Megabyte Labs"
LABEL org.opencontainers.image.version=$VERSION
LABEL space.megabyte.type="codeclimate"

FROM hadolint/hadolint:latest-alpine AS hadolint

USER root

ENTRYPOINT ["hadolint"]
CMD ["--version"]

LABEL space.megabyte.type="linter"
