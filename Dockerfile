# Multi-stage build - See https://docs.docker.com/engine/userguide/eng-image/multistage-build

FROM dlanguage/dmd as dmd

RUN apt-get update \
  && apt-get install -y git make libcurl4-openssl-dev libsqlite3-dev \
  && git clone https://github.com/abraunegg/onedrive.git \
  && cd onedrive \
  && make \
  && make install


# Primary image
FROM oznu/s6-debian:latest

RUN apt-get update \
  && apt-get install -y libcurl4-openssl-dev libsqlite3-dev \
  && mkdir /documents \
  && chown abc:abc /documents

COPY --from=dmd /usr/local/bin/onedrive /usr/local/bin/onedrive
COPY root /

ENV S6_BEHAVIOUR_IF_STAGE2_FAILS 2

CMD ["/start.sh"]
