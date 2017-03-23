# Yeah, S6 is "alpine-ready". Differentely from supervisord
# and runit, it looks like the simplest one with the most 
# straightforward build that one can find.
FROM alpine

# Here we don't need more for this demo. The sample process
# at `./etc/bin/my-binary` is just a bash script.
RUN set -x && \
    apk add --update \
      s6 \
      bash

ADD ./etc /etc

# Adding `s6-svscan` as our entrypoint guarantees that
# we'll have it running as our PID-1 processes.
#
# /etc/s6 indicates the "scan directory", that is,
# where our services live.
ENTRYPOINT [ "/bin/s6-svscan", "/etc/s6" ]

