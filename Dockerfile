FROM alpine

RUN set -x && \
    apk add --update s6 bash

ADD ./etc /etc

ENTRYPOINT [ "/bin/s6-svscan", "/etc/s6" ]

