#syntax=docker/dockerfile:1.2
FROM alpine:3.15 as builder

ARG GH_VERSION=2.10.1
RUN apk add --no-cache wget rsync && \
    wget https://github.com/cli/cli/releases/download/v${GH_VERSION}/gh_${GH_VERSION}_linux_amd64.tar.gz && \
    tar -zxvf gh_${GH_VERSION}_linux_amd64.tar.gz && \
    chmod +x gh_${GH_VERSION}_linux_amd64/bin/gh && \
    rsync -az --remove-source-files gh_${GH_VERSION}_linux_amd64/bin/ /usr/bin

FROM alpine:3.15 as gh

RUN apk add --no-cache git libc6-compat
COPY --from=builder /usr/bin/gh /usr/bin/

VOLUME /gh
WORKDIR /gh

ENTRYPOINT ["gh"]
CMD ["--help"]
