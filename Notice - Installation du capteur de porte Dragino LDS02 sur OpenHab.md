# Tutoriel d'installation du capteur de porte Dragino LDS02 sur OpenHab

Le but de ce tutoriel est l'installation d'une extension pour permettre à un serveur OpenHab de récuperer les informations remontés par un objet via un réseau LoRaWAN. Dans notre cas, l'objet sera un capteur d'ouverture ou fermeture de porte.

Un docker-compose file est disponible dans le [repository](https://github.com/Projet-INFO-S10/Domus-Docs) et permet l'installation d'une instance de serveur OpenHab. Pour l'utiliser, il faut d'avoir installé sur sa machine, docker et docker-compose.
Après avoir cloné le repository, il suffit d'exécuter la commande:

    docker-compose up -d

Pour se connecter au serveur OpenHab, il faut se connecter sur un navigateur web à l'adresse: `localhost:8080`
Une fois le compte openhab créé, voici les étapes à suivre pour établir la liaison avec campusIot, afin de récupérer les données.

## 1. Installation de MQTT sur OpenHab

- Cliquer sur "Paramètres" 
- Dans la catégorie "Add-ons", cliquer sur "Bindings" 
- Dans la liste "openHab Distributions", chercher "MQTT Binding" (dans l'ordre alphabétique, donc chercher dans les bindings supplémentaires)
- Retourner dans "Paramètres" cliquer sur "Automation"
- Installer les trois extensions "JavaScript Scripting", "JavaScript Transformation", "JsonPath Transformation"

## 2. Ajout du Broker serveur MQTT dans openHab

- Dans "Paramètres", cliquer sur "Things"
- Cliquer sur le bouton bleu "+"
- Choisir "MQTT Binding"
- Choisir "MQTT Broker"
- Montrer les paramètres avancés (Show advanced)
- Dans "Broker Hostname/IP", écrire l'adresse du broker MQTT
- Dans "Broker Port", écrire "8883"
- Activer "Secure Connection"
- Dans "Username", écrire le nom d'utilisateur à utiliser
- Dans "Password", écrire le mot de passe pour se connecter au broker
- Valider avec le bouton "Create Thing" en bas de page

## 3. Création de la connexion avec le Broker

- Dans "Paramètres", cliquer sur "Things"
- Cliquer sur le bouton bleu "+"
- Choisir "MQTT Binding"
- Choisir "Generic MQTT Thing"
- Dans "Bridge", choisir "MQTT Broker"
- Valider avec le bouton "Create Thing" en bas de page

## 4. Ajout d'un channel dans l'objet générique MQTT

- Dans "Paramètres", cliquer sur "Things"
- Choisir l'élément "Generic MQTT Thing"
- En haut, sélectionner "Channels"
- Cliquer sur "Add Channel"
- Dans "Channel Identifier", écrire un identifiant (ex: "243")
- Dans "Label", écrire un nom dans openHab (ex: "DRAGINO_LDS02")
- Dans "Channel Type", choisir "Text Value"
- Dans "MQTT State Topic", écrire "application/243/device/+/rx"
- Valider avec le bouton "Create" en bas de page

## 5. Création de l'item "Door"

- Dans "Paramètres", cliquer sur "Items"
- Cliquer sur le bouton "+" et ajouter un item
- Choisir le nom "Door" et un label
- Cliquer sur "Add Equipment to Model"
- Choisir la catégorie "door"
- Dans "Category", écrire "door", puis créer l'item
- Cliquer sur l'item "Door" qui vient d'être créé
- Ajouter le channel "DRAGINO_LDSO2"
- Dans profile, sélectionner "JSONPATH" et ajouter "$.object."DOOR_OPEN_STATUS" dans le champ de saisie
- Dans "Items", sélectionner l'item "Door", cliquer sur "Add Metadata" puis "State Description"
- Dans le champ "Options", ajouter:
1=OPEN
0=CLOSE

## 6. Tester la réception de données

- Dans "Paramètres", cliquer sur "Model"
- Cliquer sur la flèche dans  l'équipement MQTT créé
- Cliquer sur l'item "Door"
- Lorsqu'une donnée est envoyée sur campusiot, elle est récupérée ici et le statut de la porte s'affiche.

ATTENTION : il est possible que les éléments soient en mode 'erreur' si le wifi utilisé est celui de l'UGA (blocage de certains paquets ou de la connexion au serveur de campusIoT)
