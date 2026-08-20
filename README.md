
# Docker

Collection of Docker images for data analysis, geospatial computing, and other workflows.

## Images

### Quarto
R environment with Quarto 1.10.18 for rendering documents.

**Pull:**
```bash
docker pull ghcr.io/edgar-treischl/quarto:latest
docker run --rm -it ghcr.io/edgar-treischl/quarto:latest R
```

### R Packages

R environment with typical R packages to develop an R packaga preinstalled.

**Pull:**
```bash
docker pull ghcr.io/edgar-treischl/r-packages:latest
```

## Available Tags

- `latest` — Latest build from `main` branch
- `main-<sha>` — Specific commit (e.g., `main-a1b2c3d`)

## Local Development

```bash
make build [IMAGE=quarto]   # Build image
make run [IMAGE=quarto]     # Run container
make test [IMAGE=quarto]    # Test image
make clean [IMAGE=quarto]   # Remove image
```


