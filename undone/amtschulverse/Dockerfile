# AmtSchulVerse Image based on
FROM rocker/r-ver:latest


# Install system libraries needed by common R packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    # for httr, curl, blastula
    libcurl4-openssl-dev \
    # for httr, blastula
    libssl-dev \
    # for xml parsing (yaml, config)
    libxml2-dev \
    # for RPostgres (PostgreSQL client libraries)
    libpq-dev \
    # for ggplot2 (text rendering)
    libfontconfig1-dev \
    # for ggplot2 (fonts)
    libfreetype6-dev \
    # for ggplot2 (PNG graphics)
    libpng-dev \
    # for ggplot2 (TIFF support)
    libtiff5-dev \
    # for ggplot2 (JPEG support)
    libjpeg-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*


# Install pak for fast and reliable package installation
RUN R -e "install.packages(c('pak'), repos = 'https://cran.rstudio.com')"
RUN R -e "pak::pkg_install(c('renv', 'remotes', 'pkgdown'))"


# Copy the already cloned repo
COPY AmtSchulGit /amtschulgit
COPY AmtSchulBSR /amtschulbsr

# Install your R package
RUN R -e "remotes::install_local('/amtschulgit')"
RUN R -e "remotes::install_local('/amtschulbsr')"



# Optional: Set working directory (useful in CI/CD)
WORKDIR /project

# Default command
CMD ["R"]
