#syntax=docker/dockerfile:1.2
FROM --platform=$BUILDPLATFORM alpine:3.17 as builder

ARG TARGETPLATFORM
ARG BUILDPLATFORM
ARG GH_VERSION=2.10.1

RUN export RELEASE_LOCATION="${GH_VERSION}_$(echo "${BUILDPLATFORM//\//_}")" && \
    apk add --no-cache wget rsync && \
    wget https://github.com/cli/cli/releases/download/v${GH_VERSION}/gh_${RELEASE_LOCATION}.tar.gz && \
    tar -zxvf gh_${RELEASE_LOCATION}.tar.gz && \
    chmod +x gh_${RELEASE_LOCATION}/bin/gh && \
    rsync -az --remove-source-files gh_${RELEASE_LOCATION}/bin/ /usr/bin

FROM alpine:3.17 as gh

RUN apk add --no-cache git libc6-compat
COPY --from=builder /usr/bin/gh /usr/bin/

VOLUME /gh
WORKDIR /gh

ENTRYPOINT ["gh"]
CMD ["--help"]
