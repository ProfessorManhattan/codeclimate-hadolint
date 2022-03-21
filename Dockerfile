FROM hadolint/hadolint:alpine AS codeclimate

WORKDIR /work

COPY engine.json ./
COPY local/codeclimate-hadolint /usr/local/bin/codeclimate-hadolint

RUN adduser --uid 9000 app \
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
LABEL org.opencontainers.image.description="Code Climate engine for Hadolint"
LABEL org.opencontainers.image.documentation="https://gitlab.com/megabyte-labs/docker/codeclimate/hadolint/-/blob/master/README.md"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.revision=$REVISION
LABEL org.opencontainers.image.source="https://gitlab.com/megabyte-labs/docker/codeclimate/hadolint.git"
LABEL org.opencontainers.image.url="https://megabyte.space"
LABEL org.opencontainers.image.vendor="Megabyte Labs"
LABEL org.opencontainers.image.version=$VERSION
LABEL space.megabyte.type="codeclimate"

FROM codeclimate AS hadolint

WORKDIR /work

USER root

RUN rm /engine.json /usr/local/bin/codeclimate-hadolint

ENTRYPOINT ["hadolint"]
CMD ["--version"]

LABEL space.megabyte.type="linter"
