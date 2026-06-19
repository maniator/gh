#syntax=docker/dockerfile:1.2
FROM --platform=$BUILDPLATFORM alpine:3.24.1 as builder

ARG TARGETPLATFORM
ARG BUILDPLATFORM
ARG GH_VERSION=2.95.0

# Download the gh release built for the TARGET platform (not the build host), so
# multi-arch images ship the correct binary. gh's asset names don't match Docker's
# platform strings 1:1 (e.g. linux/arm64/v8 -> linux_arm64, and there is no armv7
# build -- the armv6 binary runs on armv7), so map them explicitly.
RUN case "${TARGETPLATFORM:-linux/amd64}" in \
      "linux/amd64")                  GH_ARCH="linux_amd64" ;; \
      "linux/arm64" | "linux/arm64/v8") GH_ARCH="linux_arm64" ;; \
      "linux/arm/v7" | "linux/arm/v6") GH_ARCH="linux_armv6" ;; \
      "linux/386")                    GH_ARCH="linux_386" ;; \
      *) echo "unsupported TARGETPLATFORM: ${TARGETPLATFORM}" >&2; exit 1 ;; \
    esac && \
    RELEASE_LOCATION="${GH_VERSION}_${GH_ARCH}" && \
    apk upgrade --no-cache && \
    apk add --no-cache wget rsync && \
    wget -q "https://github.com/cli/cli/releases/download/v${GH_VERSION}/gh_${RELEASE_LOCATION}.tar.gz" && \
    tar -zxvf "gh_${RELEASE_LOCATION}.tar.gz" && \
    chmod +x "gh_${RELEASE_LOCATION}/bin/gh" && \
    rsync -az --remove-source-files "gh_${RELEASE_LOCATION}/bin/" /usr/bin

FROM alpine:3.24.1 as gh

RUN apk upgrade --no-cache && apk add --no-cache git libc6-compat
COPY --from=builder /usr/bin/gh /usr/bin/

VOLUME /gh
WORKDIR /gh

ENTRYPOINT ["gh"]
CMD ["--help"]
