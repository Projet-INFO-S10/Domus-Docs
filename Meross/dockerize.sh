#!/bin/sh
if [ -x "$(command -v docker)" ]; then  # Check if docker is installed
    echo "Setting up openhab into a docker container..."
    bash key_generator.sh
    docker-compose up -d # Start the docker container
    echo "The MQTT Broker is now running in a docker container"

    git clone https://github.com/bytespider/Meross
    cd Meross
    npm i

    echo "The next step requires you to connect to the WiFi of your Meross device, so please do it before continuing."

    echo "Please enter the SSID of your WiFi network: "
    read SSID
    echo "Please enter the password of your WiFi network: "
    read PASSWORD
    echo "Setting up WiFi connection..."

    cd bin
    ./meross setup --gateway 10.10.10.1 --wifi-ssid $SSID --wifi-pass $PASSWORD --mqtt mqtts://172.25.0.2:8883

    echo "The Meross device is now connected to your WiFi network and the MQTT broker, you can switch back to your normal WiFi network."

else
    echo "Please Install docker and docker-compose"
fi