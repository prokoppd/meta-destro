#!/usr/bin/env bash

set -e

IMAGE_NAME="destro"
CONTAINER_TOOL=""

# test if docker or podman is installed
if command -v docker &> /dev/null; then
    CONTAINER_TOOL="docker"
elif command -v podman &> /dev/null; then
    CONTAINER_TOOL="podman"
else
    echo "Error: Neither docker nor podman is installed." >&2
    exit 1
fi

# Show which tool is being used
echo "Using container tool: $CONTAINER_TOOL"

# Build the Docker image
$CONTAINER_TOOL build -t $IMAGE_NAME .
echo "Docker image '$IMAGE_NAME' built successfully using $CONTAINER_TOOL."
echo "You can run the container using: $CONTAINER_TOOL run -it $IMAGE_NAME"
