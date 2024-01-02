FROM alpine:3.14
RUN apk add --no-cache cdrkit
RUN apk add --no-cache ffmpeg
ENTRYPOINT ["tail", "-f", "/dev/null"]

