## Georgios Gousios's homepage

This is the source code to my homepage.

## Build instructions

### Using Make (Recommended)

The project includes a Makefile with several convenient targets:

```bash
# Build the website using Docker
make docker-build
make build

# Start a local web server to preview the site
make web

# Deploy the website (after building)
make deploy

# Build and deploy in one step using Docker
make docker-deploy

# Build and deploy entirely within Docker (requires SSH keys)
make docker-deploy-with-ssh
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
from the `_bibliography/all.bib` file, therefore it must be created prior
to running `jekyll`

## Deploying

### Option 1: Build locally, deploy from host
```bash
make docker-deploy
```

### Option 2: Build and deploy entirely within Docker
```bash
make docker-deploy-with-ssh
```

### Option 3: Manual deployment
```bash
jekyll build
rsync -av _site/* gousiosg@192.168.1.166:~/gousios.gr/
```

## License

[2-clause BSD](http://www.opensource.org/licenses/bsd-license.php)
