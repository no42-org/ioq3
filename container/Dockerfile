ARG BASE_IMAGE="ubuntu"
ARG BASE_IMAGE_VERSION="focal"

FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}

ADD ./ioq3-linux-x86_64.tar.gz2 /opt
COPY container-fs/entrypoint.sh /

RUN addgroup --gid 1000 ioq3 && \
  adduser --system --shell /bin/false --uid 1000 --ingroup ioq3 --home /opt/ioq3-linux-x86_64 ioq3 && \
  mkdir -m 777 /baseq3-overlay && \
  chown ioq3:ioq3 /baseq3-overlay /opt/ioq3-linux-x86_64 /entrypoint.sh

USER 1000

WORKDIR /opt/ioq3-linux-x86_64

VOLUME [ "/baseq3-overlay" ]

ENTRYPOINT [ "/entrypoint.sh" ]

CMD [ "-v" ]
