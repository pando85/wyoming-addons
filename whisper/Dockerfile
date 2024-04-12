FROM ghcr.io/opennmt/ctranslate2:4.2.0-ubuntu20.04-cuda12.2

# Install Whisper
WORKDIR /usr/src
ARG WHISPER_VERSION='2.0.0'

RUN \
    apt-get update \
    && apt-get install -y --no-install-recommends \
        python3 \
        python3-pip \
    \
    && pip3 install --no-cache-dir \
        --extra-index-url https://www.piwheels.org/simple \
        "wyoming-faster-whisper==${WHISPER_VERSION}" \
    \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /
COPY run.sh ./

EXPOSE 10300

ENTRYPOINT ["bash", "/run.sh"]
