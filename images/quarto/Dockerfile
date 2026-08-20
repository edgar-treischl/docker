FROM rocker/r-ver:4.5.3

ARG QUARTO_VERSION=1.10.18

# System dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        wget \
        tar \
        libudunits2-0 \
        libudunits2-dev \
        libgdal-dev \
        libgeos-dev \
        libproj-dev \
        libsqlite3-dev \
        libuv1 \
    && rm -rf /var/lib/apt/lists/*

# Install Quarto
RUN set -eux; \
    wget -q \
        "https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-amd64.tar.gz" \
        -O /tmp/quarto.tar.gz; \
    mkdir -p /opt/quarto; \
    tar -xzf /tmp/quarto.tar.gz \
        --strip-components=1 \
        -C /opt/quarto; \
    ln -s /opt/quarto/bin/quarto /usr/local/bin/quarto; \
    rm -f /tmp/quarto.tar.gz

# Install R package
RUN R --vanilla --quiet --slave -e "install.packages('remotes', repos='https://cloud.r-project.org')" && \
    R --vanilla --quiet --slave -e "packageVersion('remotes')" && \
    quarto --version

# Test
RUN set -eux; \
    which quarto; \
    which R; \
    test -f /opt/quarto/bin/quarto
