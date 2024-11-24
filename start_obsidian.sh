#!/bin/bash

# Ensure the directories exist
mkdir -p ~/docker_data/obsidian/config
mkdir -p ~/docker_data/obsidian/vaults

# Set permissions
PUID=$(id -u)
PGID=$(id -g)

chown -R $PUID:$PGID ~/docker_data/obsidian/config
chown -R $PUID:$PGID ~/docker_data/obsidian/vaults

# Check if the container is already running
if [ "$(docker ps -q -f name=obsidian)" ]; then
    echo "Success: The Obsidian container is already running."
else
    # Check if the local image is up to date
    LOCAL_DIGEST=$(docker image inspect lscr.io/linuxserver/obsidian:latest --format '{{.RepoDigests}}')
    REMOTE_DIGEST=$(docker pull --quiet lscr.io/linuxserver/obsidian:latest | tail -n 1)

    if [ "$LOCAL_DIGEST" != "$REMOTE_DIGEST" ]; then
        echo "Updating to the latest image..."
        docker-compose pull
    else
        echo "You already have the latest image."
    fi

    # Start the container
    docker-compose up -d
    echo "Obsidian container has been started."
fi