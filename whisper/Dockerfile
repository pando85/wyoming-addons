FROM ghcr.io/opennmt/ctranslate2:4.5.0-ubuntu20.04-cuda12.2

# Install Whisper
WORKDIR /usr/src
ARG WYOMING_WHISPER_VERSION='2.4.0'

RUN \
    apt-get update \
    && apt-get install -y --no-install-recommends \
        python3 \
        python3-pip \
        build-essential \
        python3-dev \
    \
    && pip3 install --no-cache-dir \
        --extra-index-url https://www.piwheels.org/simple \
        # workaround tokenizers>=0.21.0
        # https://github.com/huggingface/tokenizers/issues/1691
        tokenizers==0.20.3 \
        "wyoming-faster-whisper @ https://github.com/rhasspy/wyoming-faster-whisper/archive/refs/tags/v${WYOMING_WHISPER_VERSION}.tar.gz" \
    \
    && apt-get purge -y --auto-remove \
        build-essential \
        python3-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /
COPY run.sh ./

EXPOSE 10300

ENTRYPOINT ["bash", "/run.sh"]
