FROM python:3.9-alpine

LABEL maintainer="Florian JUDITH <florian.judith.b@gmail.com>"

# Install locust
RUN apk add --no-cache curl python3-dev build-base git libffi-dev libtool gcc pkgconfig zeromq-dev autoconf automake wget ca-certificates && \
    pip3 install pyzmq locust faker && \
    apk del python3-dev build-base git libtool pkgconfig autoconf gcc zeromq-dev automake wget ca-certificates && \
    apk add --no-cache libstdc++ libzmq

COPY src/locustfile.py /config/locustfile.py
COPY src/runLocust.sh /usr/local/bin/runLocust.sh
RUN chmod +x /usr/local/bin/runLocust.sh

ENV LOCUST_FILE /config/locustfile.py

EXPOSE 8089

ENTRYPOINT ["/usr/local/bin/runLocust.sh"]
