## Georgios Gousios's homepage

This is the source code to my homepage.

## Dependencies

The build system requires:
- `yq` - YAML processor (automatically installed via Homebrew if missing)
- `docker` - Container runtime
- Configuration values are read from `_config.yml`

## Build instructions

### Using Make (Recommended)

The project includes a Makefile with several convenient targets:

```bash
# Check for dependencies (yq and docker)
make check_deps

# Generate bibliography file from _bibliography/*.bib files
make bib

# Prepare course slides
make courses

# Build the docker image
make docker-build

# Build the website using Docker
make build

# Deploy the website (builds docker image and deploys with SSH keys)
make deploy

# Clean up generated files
make clean
```

### Manual Docker commands

To build the docker container:

```bash
docker build -t gousiosg/website .
```

To debug:

```bash
docker run -p 4000:4000 -v $(pwd):/site -it --name homepage gousiosg/website /bin/bash
```

To build the web site:

```bash
docker run -v $(pwd):/site gousiosg/website
```

The `jekyll-scholar` plugin is configured to read its publication database
from the `_bibliography/all.bib` file. The Makefile automatically generates
this file by combining all `.bib` files found in the `_bibliography/` directory
when running `make bib` or `make build`.

## Deploying

### Using Make (Recommended)
```bash
make deploy
```

This command will:
1. Check dependencies
2. Generate bibliography files
3. Build the Docker image
4. Deploy the website using SSH keys (requires SSH keys to be configured)

### Manual deployment
```bash
jekyll build
rsync -av _site/* gousiosg@192.168.1.166:~/gousios.gr/
```

## License

[2-clause BSD](http://www.opensource.org/licenses/bsd-license.php)
