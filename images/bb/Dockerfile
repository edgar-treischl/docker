FROM rocker/r-ver:4.4.3

LABEL description="BB Docker"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        cmake \
        git \
        openssh-client \
        pandoc \
        \
        libcurl4-openssl-dev \
        libssl-dev \
        libxml2-dev \
        libgit2-dev \
        \
        libpng-dev \
        libjpeg-dev \
        libwebp-dev \
        libtiff5-dev \
        \
        libfreetype6-dev \
        libharfbuzz-dev \
        libfribidi-dev \
        libfontconfig1-dev \
        libcairo2-dev \
        libpango1.0-dev \
        \
        libpq-dev \
        zlib1g-dev \
        libbz2-dev \
        liblzma-dev \
        libpcre3-dev \
        libicu-dev \
        \
        gdal-bin \
        libgdal-dev \
        libproj-dev \
        libgeos-dev \
        libudunits2-dev \
        \
        libv8-dev \
        libmagick++-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install pak
RUN R -e "install.packages('pak', repos='https://cloud.r-project.org/')"

# Install R package development / CI tooling
RUN R -e "pak::pkg_install(c( \
    'rcmdcheck', \
    'pkgdown', \
    'testthat', \
    'remotes', \
    'rmarkdown', \
    'knitr', \
    'covr', \
    'lintr', \
    'roxygen2', \
    'usethis', \
    'desc', \
    'sessioninfo' \
))"


# Install project dependencies
RUN R -e "pak::pkg_install(c( \
    'cli', \
    'data.table', \
    'DBI', \
    'dplyr', \
    'forcats', \
    'fs', \
    'ggalluvial', \
    'ggpattern', \
    'ggplot2', \
    'gt', \
    'here', \
    'janitor', \
    'patchwork', \
    'purrr', \
    'RColorBrewer', \
    'readr', \
    'readxl', \
    'rlang', \
    'RSQLite', \
    'scales', \
    'sf', \
    'stats', \
    'stringr', \
    'tibble', \
    'tidyr', \
    'tidyselect', \
    'tidytext', \
    'usethis', \
    'utils', \
    'yaml' \
))"



WORKDIR /workspace

CMD ["R"]
