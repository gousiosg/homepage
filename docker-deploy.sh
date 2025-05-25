#!/usr/bin/env bash

# Build the Jekyll site
echo "Building Jekyll site..."
bundle exec jekyll build

# Check if build was successful
if [ $? -ne 0 ]; then
    echo "Jekyll build failed!"
    exit 1
fi

# Deploy using rsync
echo "Deploying to server..."
rsync -av --delete _site/* gousiosg@192.168.1.166:~/gousios.gr/ || exit 1

# Set file permissions to 644 for all files
echo "Setting file permissions to 644..."
ssh gousiosg@192.168.1.166 "find ~/gousios.gr/ -type f -exec chmod 644 {} \;" || exit 1

echo "Deployment completed successfully!"