#!/bin/sh
if [ -x "$(command -v docker)" ]; then  # Check if docker is installed
    if git clone git@gricad-gitlab.univ-grenoble-alpes.fr:plateforme-domus/appartement.git; then # Check if git clone is successful
        echo "git clone success !"
        mkdir openhab_addons openhab_userdata # Create the folders for the docker container

        echo "Setting up openhab into a docker container..."
        docker-compose up -d # Start the docker container
    else
        echo "git clone failed ! Please check that you have the right to clone the repository"
    fi
else
    echo "Please Install docker and docker-compose"
fi