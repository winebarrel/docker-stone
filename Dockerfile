FROM debian:bullseye AS build

ARG STONE_VERSION=2.4

RUN apt-get update && \
  apt-get install -y curl build-essential

RUN curl -sSfLO https://www.gcd.org/sengoku/stone/stone-${STONE_VERSION}.tar.gz && \
  tar xf stone-${STONE_VERSION}.tar.gz --strip-components 1 && \
  make linux

FROM debian:bullseye-slim

COPY --from=build stone /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/stone"]
