# r-shiny/Dockerfile

# Get the latest image
FROM rocker/shiny:latest

# Label the image
LABEL maintainer="edgar.treischl@bayern.isb.de"
LABEL description="R base image with reporting"

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    git \
    openssh-client \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install R packages using pak for faster installation
RUN R -e "install.packages('pak', repos='https://cloud.r-project.org/'); \
          pak::pkg_install(c('devtools', 'bslib', 'dplyr', 'ggplot2', 'gt', 'tidyr', 'sysfonts', 'emoji', 'showtext', 'remotes'))"

# Set default working directory
WORKDIR /home/rstudio

# Entry
CMD ["R"]


