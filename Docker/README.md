# Création d'une instance d'OpenHab dans un conteneur Docker

## Prérequis

Docker et Docker-Compose doivent être installés sur la machine hôte afin de pouvoir créer et gérer le conteneur contenant OpenHab.

## Conteneurisation

Afin de créer le conteneur, il suffit d'éxecuter le script shell suivant ```dockerize.sh``` via la commande: ```bash dockerize.sh```.
Ce script va commencer par cloner le repository git contenant les fichiers de configuration disponibles sur Gitlab. Il va ensuite créer le conteneur via le fichier docker-compose.yml.