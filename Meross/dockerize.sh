#!/bin/sh
if [ -x "$(command -v docker)" ]; then  # Check if docker is installed
        echo "Setting up openhab into a docker container..."
        bash key_generator.sh
        docker-compose up -d # Start the docker container
else
    echo "Please Install docker and docker-compose"
fi