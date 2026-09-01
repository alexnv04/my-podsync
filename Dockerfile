FROM ghcr.io/mxpv/podsync:latest

RUN rm -rf /usr/local/bin/youtube-dl && \
    wget https://github.com/yt-dlp/yt-dlp-nightly-builds/releases/latest/download/yt-dlp -O /usr/local/bin/youtube-dl && \
    chmod a+rx /usr/local/bin/youtube-dl && \
    ln -sf /usr/local/bin/youtube-dl /usr/bin/yt-dlp && \
    ln -sf /usr/local/bin/youtube-dl /usr/bin/youtube-dl

# Install Deno so yt-dlp has a JS runtime available for YouTube's player challenge
RUN wget -qO /tmp/deno.zip https://github.com/denoland/deno/releases/latest/download/deno-x86_64-unknown-linux-gnu.zip && \
    unzip -o /tmp/deno.zip -d /usr/local/bin && \
    chmod a+rx /usr/local/bin/deno && \
    rm /tmp/deno.zip

RUN mkdir -p /etc/yt-dlp-plugins && \
    wget https://github.com/Brainicism/bgutil-ytdlp-pot-provider/releases/latest/download/bgutil-ytdlp-pot-provider.zip \
    -O /etc/yt-dlp-plugins/bgutil-ytdlp-pot-provider.zip

COPY config.toml /app/config.toml
WORKDIR /app
