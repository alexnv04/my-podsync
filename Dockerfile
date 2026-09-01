FROM ghcr.io/mxpv/podsync:latest
COPY config.toml /app/config.toml
COPY cookies.txt /app/cookies.txt
WORKDIR /app
CMD ["/app/podsync", "--config", "/app/config.toml"]
