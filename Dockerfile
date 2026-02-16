# syntax=docker/dockerfile:1

FROM debian:bookworm-slim AS builder

ARG BEDTOOLS_VERSION=v2.31.1
ARG BEDTOOLS_URL=https://github.com/arq5x/bedtools2/archive/refs/tags/v2.31.1.tar.gz
ARG BEDTOOLS_SHA256=79a1ba318d309f4e74bfa74258b73ef578dccb1045e270998d7fe9da9f43a50e

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates curl g++ make python3 zlib1g-dev libbz2-dev liblzma-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /src
RUN curl -fsSL "$BEDTOOLS_URL" -o bedtools.tar.gz \
    && echo "$BEDTOOLS_SHA256  bedtools.tar.gz" | sha256sum -c - \
    && tar -xzf bedtools.tar.gz

WORKDIR /src/bedtools2-2.31.1
RUN make CXXFLAGS="-O2 -static" LDFLAGS="-static" bin/bedtools \
    && test -x bin/bedtools \
    && cp bin/bedtools /tmp/bedtools

FROM scratch
COPY --from=builder /tmp/bedtools /usr/local/bin/bedtools
WORKDIR /data
ENTRYPOINT ["/usr/local/bin/bedtools"]
