#!/bin/bash

echo "Welcome in the Meross configuration script "
echo "Cloning the repository"

DIRECTORY=Meross
if [ ! -d "$DIRECTORY" ]; then
  echo "Directory doesn't exist"
  git clone https://github.com/bytespider/Meross
fi

cd $DIRECTORY

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

    echo "now, connect to the network where OpenHab is, and press Y to continue"
    read mot
    while
    [ "$mot" = "Y" ]
    do
    echo "now, connect to the network where OpenHab is, and press an touch to continue"
    read mot
    done

    ./meross setup --gateway $gateway --wifi-ssid $ssid --wifi-pass $password --mqtt mqtts://172.25.0.2:8883
else
    echo "Please Install npm"
    echo "Look at: https://docs.npmjs.com/cli/v7/configuring-npm/install "
fi

