
FROM ghcr.io/gleam-lang/gleam:v1.19.2-erlang

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        bash ca-certificates curl git sudo \
    && rm -rf /var/lib/apt/lists/* \
    && useradd --create-home --shell /bin/bash vscode \
    && echo 'vscode ALL=(root) NOPASSWD:ALL' > /etc/sudoers.d/vscode \
    && chmod 0440 /etc/sudoers.d/vscode

USER vscode
ENV HOME=/home/vscode
