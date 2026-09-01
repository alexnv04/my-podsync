FROM ghcr.io/mxpv/podsync:latest

RUN rm -rf /usr/local/bin/youtube-dl && \
    wget https://github.com/yt-dlp/yt-dlp-nightly-builds/releases/latest/download/yt-dlp -O /usr/local/bin/youtube-dl && \
    chmod a+rx /usr/local/bin/youtube-dl && \
    ln -sf /usr/local/bin/youtube-dl /usr/bin/yt-dlp && \
    ln -sf /usr/local/bin/youtube-dl /usr/bin/youtube-dl

RUN mkdir -p /etc/yt-dlp-plugins && \
    wget https://github.com/Brainicism/bgutil-ytdlp-pot-provider/releases/latest/download/bgutil-ytdlp-pot-provider.zip \
    -O /etc/yt-dlp-plugins/bgutil-ytdlp-pot-provider.zip

COPY config.toml /app/config.toml
WORKDIR /app
