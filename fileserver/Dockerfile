FROM alpine:3.18
RUN apk add --no-cache python3
RUN mkdir /usr/local/app/
COPY ./generate.sh /usr/local/app/
WORKDIR /usr/local/app/
RUN /bin/sh generate.sh > 10mb.html
ENTRYPOINT ["python", "-m", "http.server", "9000"]
