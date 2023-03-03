#!/bin/sh
if [ -x "$(command -v docker)" ]; then  # Check if docker is installed
    if git clone git@gricad-gitlab.univ-grenoble-alpes.fr:plateforme-domus/appartement.git; then # Check if git clone is successful
        echo "git clone success !"
        mkdir openhab_addons openhab_userdata # Create the folders for the docker container

        echo "Welcome in the Meross configuration script "

        echo "Certificates generation"
        bash key_generator.sh

        echo "Starting MQTT Broker container"
        docker-compose up -d

        echo "Cloning the repository"

        DIRECTORY=Meross
        if [ ! -d "$DIRECTORY" ]; then
        echo "Directory doesn't exist"
        git clone https://github.com/bytespider/Meross
        fi

        cd $DIRECTORY/bin

        if [ -x "$(command -v npm)" ]; then  # Check if npm is installed
            npm i
            echo "Now, change the network your connected at to get connected to Meross outlet network "

            echo "Do you want to continue ? [y/n]"
            read ANSWER
            while
            [ "$ANSWER" = "Y" ]
            do
            echo "Do you want to continue ? [y/n]"
            read ANSWER
            done

            echo "Welcome in the part 2 of the script."
            echo "Be sure that the outlet is set to default configuration" 
            echo "To reset to factory default the outlet, hold the button down for 5s"

            echo "Do you want to continue ? [y/n]"
            read ANSWER
            while
            [ "$ANSWER" = "Y" ]
            do
            echo "Do you want to continue ? [y/n]"
            read ANSWER
            done

            GATEWAY=10.10.10.1

            echo "What is the SSID that the outlet need to connect to ? "
            read SSID
            echo "What is the PASSWORD that the outlet need to connect to ? "
            read PASSWORD
            echo "What is the IP address of the machine that is running the MQTT broker ? "
            read IP

            PORT=8884
            
            ./meross setup --gateway $GATEWAY --wifi-ssid $SSID --wifi-pass $PASSWORD --mqtt mqtts://$IP:$PORT
            
            echo "Now, connect to the network where OpenHab is, and press a key to continue"
            read ANSWER
            while
            [ "$ANSWER" = "Y" ]
            do
            echo "Now, you connect back to the your network, and press a key to continue"
            read ANSWER
            done

            echo "Successfully done !"
            
        else
            echo "Please Install npm"
            echo "Look at: https://docs.npmjs.com/cli/v7/configuring-npm/install "
        fi

    else
        echo "git clone failed ! Please check that you have the right to clone the repository"
    fi
else
    echo "Please Install docker and docker-compose"
fi
