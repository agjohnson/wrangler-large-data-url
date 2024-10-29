FROM alpine:3.18
RUN apk add --no-cache curl
RUN mkdir /usr/local/app/
COPY ./tests.sh /usr/local/app/
WORKDIR /usr/local/app/
ENTRYPOINT ["/bin/sh", "tests.sh"]
