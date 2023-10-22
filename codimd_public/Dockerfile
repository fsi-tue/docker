FROM hackmdio/hackmd:2.4.2

USER root

RUN apt-get update && \
  apt-get install --no-install-recommends -y curl && \
  rm -rf /var/lib/apt/lists/*

USER hackmd
