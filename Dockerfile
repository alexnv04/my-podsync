FROM ghcr.io/mxpv/podsync:latest

RUN wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O /usr/bin/yt-dlp && \
    chmod a+rx /usr/bin/yt-dlp && \
    ln -sf /usr/bin/yt-dlp /usr/bin/youtube-dl

RUN mkdir -p /app/yt-dlp-plugins && \
    wget https://github.com/Brainicism/bgutil-ytdlp-pot-provider/releases/latest/download/bgutil-ytdlp-pot-provider.zip \
    -O /app/yt-dlp-plugins/bgutil-ytdlp-pot-provider.zip

COPY config.toml /app/config.toml
WORKDIR /app
