# Build context stage: keep customization files out of the final image.
FROM scratch AS ctx
COPY build_files/ /
COPY system_files/ /system_files/

# First target: the NVIDIA Open variant matching the development machine.
FROM ghcr.io/ublue-os/bazzite-nvidia-open:stable

LABEL org.opencontainers.image.title="AURORA Gaming OS"
LABEL org.opencontainers.image.description="A controller-first gaming operating system based on Bazzite NVIDIA Open."
LABEL org.opencontainers.image.source="https://github.com/domenicsembal-png/AURORA-Gaming-OS"

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    bash /ctx/build.sh

RUN bootc container lint
