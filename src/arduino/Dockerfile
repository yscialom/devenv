From debian:stretch

ARG PUID=1000
ARG arduino_cli_version=0.20.2
ARG sketchbook_path=/arduino

RUN apt-get update \
    && apt-get install -yy -q --no-install-recommends ca-certificates curl python3 \
    && apt-get auto-remove \
    && rm -rf /var/lib/apt/lists/* \
    && curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/${arduino_cli_version}/install.sh | sh

RUN useradd --create-home --home-dir /home/arduino --uid ${PUID} arduino
USER arduino

RUN arduino-cli config init --overwrite --additional-urls https://arduino.esp8266.com/stable/package_esp8266com_index.json \
    && arduino-cli config set directories.user ${sketchbook_path} \
    && arduino-cli core update-index \
    && arduino-cli core install esp8266:esp8266

WORKDIR ${sketchbook_path}

ENTRYPOINT ["arduino-cli"]
CMD ["help"]
