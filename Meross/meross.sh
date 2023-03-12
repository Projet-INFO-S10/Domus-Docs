#!/bin/bash

echo "Welcome in the Meross configuration script "

echo "Certificates generation"
bash key_generator.sh

echo "Cloning the repositories"

if [ ! -d "appartement" ]; then
  echo "Cloning the appartement repository with ssh..."
  git clone git@gricad-gitlab.univ-grenoble-alpes.fr:plateforme-domus/appartement.git
fi

DIRECTORY=Meross-Domus
if [ ! -d "$DIRECTORY" ]; then
  echo "Cloning the Meross-Domus repository..."
  git clone git@github.com:Projet-INFO-S10/Meross-Domus.git
fi

echo "Starting MQTT Broker container"
docker-compose up -d

cd $DIRECTORY/bin

if [ -x "$(command -v npm)" ]; then  # Check if npm is installed
    npm i
    echo "Now, change the network your connected at to get connected to Meross outlet network "

    echo "Do you want to continue ? [Y/N]"
    read mot
    while
    [ "$mot" = "Y" ]
    do
    echo "Do you want to continue ? [Y/N]"
    read mot
    done

    echo "Welcome in the part 2 of the script."
    echo "Be sure that the outlet is set to default configuration" 
    echo "To reset to factory default the outlet, hold the button down for 5s"

    echo "Do you want to continue ? [Y/N]"
    read mot
    while
    [ "$mot" = "Y" ]
    do
    echo "Do you want to continue ? [Y/N]"
    read mot
    done

    gateway=10.10.10.1

    echo "What is the SSID that the outlet need to connect to ? "
    read ssid
    echo "What is the password that the outlet need to connect to ? "
    read password
    echo "What is the IP address of the machine that is running the MQTT broker ? "
    read ip

    port=8884
    
    ./meross setup --gateway $gateway --wifi-ssid $ssid --wifi-pass $password --mqtt mqtts://$ip:$port
    
    echo "Now, connect to the network where OpenHab is, and press a key to continue"
    read mot
    while
    [ "$mot" = "Y" ]
    do
    echo "Now, you connect back to the your network, and press a key to continue"
    read mot
    done

    echo "Successfully done !"
    
else
    echo "Please Install npm"
    echo "Look at: https://docs.npmjs.com/cli/v7/configuring-npm/install "
fi

