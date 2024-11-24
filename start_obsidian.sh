#!/bin/bash

# Ensure the directories exist
mkdir -p ~/docker_data/obsidian/config
mkdir -p ~/docker_data/obsidian/vaults

# Set permissions
PUID=$(id -u)
PGID=$(id -g)

chown -R $PUID:$PGID ~/docker_data/obsidian/config
chown -R $PUID:$PGID ~/docker_data/obsidian/vaults

# Pull the latest image and start the Obsidian container
docker-compose pull
docker-compose up -d
