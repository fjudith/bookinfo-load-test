FROM python:3.7-alpine

LABEL maintainer="Florian JUDITH <florian.judith.b@gmail.com>"

# Install locust
RUN apk add --no-cache curl python-dev build-base git libtool pkgconfig autoconf automake wget ca-certificates && \
    pip install pyzmq locustio faker && \
    apk del python-dev build-base git libtool pkgconfig autoconf automake wget ca-certificates && \
    apk add --no-cache libstdc++

ADD locustfile.py /config/locustfile.py
ADD runLocust.sh /usr/local/bin/runLocust.sh

ENV LOCUST_FILE /config/locustfile.py

EXPOSE 8089

ENTRYPOINT ["/usr/local/bin/runLocust.sh"]
