FROM python:alpine

RUN addgroup -g 1000 youtube-dl \
    && adduser -u 1000 -G youtube-dl -s /bin/sh -D youtube-dl

RUN apk update --no-cache \
    ffmpeg \
    ffmpeg-libs \
&& wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl \
&& chmod a+rx /usr/local/bin/youtube-dl

VOLUMES ["/downloads"]

WORKDIR /downloads

USER youtube-dl

ENTRYPOINT ["youtube-dl"]
