# Docker file for tuic client
# ricky9w <ricky9w@donnadie.top>
# Refer:
# https://github.com/EAimTY/tuic

FROM --platform=$TARGETPLATFORM alpine:latest

ARG TARGETPLATFORM
ARG VERSION

ENV SAVE_PATH=/usr/bin/tuic-client

RUN if [ "${TARGETPLATFORM}" = "linux/386" ]; then export TARGET=i686-unknown-linux-musl ; fi \
    && if [ "${TARGETPLATFORM}" = "linux/amd64" ]; then export TARGET=x86_64-unknown-linux-musl ; fi  \
    && if [ "${TARGETPLATFORM}" = "linux/arm/v7" ]; then export TARGET=armv7-unknown-linux-musleabihf ; fi  \
    && if [ "${TARGETPLATFORM}" = "linux/arm64" ]; then export TARGET=aarch64-unknown-linux-musl ; fi  \
    && wget -O $SAVE_PATH https://github.com/EAimTY/tuic/releases/download/${VERSION}/${VERSION}-${TARGET} \
    && chmod +x $SAVE_PATH

COPY config.json /etc/tuic/

ENTRYPOINT [ "/usr/bin/tuic-client" ]
CMD [ "-c", "/etc/tuic/config.json" ]
