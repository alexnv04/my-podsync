FROM ghcr.io/mxpv/podsync:latest

# Upgrade yt-dlp to the latest release to help avoid YouTube bot-detection blocks
RUN wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O /usr/bin/yt-dlp && \
    chmod a+rx /usr/bin/yt-dlp && \
    ln -sf /usr/bin/yt-dlp /usr/bin/youtube-dl

COPY config.toml /app/config.toml
WORKDIR /app
