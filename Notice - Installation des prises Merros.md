# Notice - Installation des prises Merros

Pour cette notice, nous considérons un système d'exploitation Ubuntu.

Attention ! Cette notice ne permet pour l'instant pas l'installation complète de la prise sur OpenHAB ! 

# Clone du repository et configuration

Dans le [repository](https://github.com/Projet-INFO-S10/Domus-docs/tree/main/Docker), sont fournis tout le nécéssaire pour la mise en place d'un environnement conteneurisé d'un serveur MQTT avec communications chiffrées. Il faut donc utiliser les commandes suivantes:

    git clone https://github.com/Projet-INFO-S10/Domus-docs
    cd Meross

Pour lancer les tout le nécessaire, cela se fait avec la commande suivante:

    ./meross.sh

Suivre les infos du script.

Ce script va cloner le repository de Domus et notre fork du repository de [bytespider](https://github.com/bytespider/Meross) qui permet la configuration et le contrôle de la prise Meross MSS310.

## Génération des certificats
Il est possible de générer des certificats en utilisant OpenSSL via le script key_generator.sh ce qui permet la communication chiffrée par TLS entre le broker mqtt et les clients.
Utiliser le script accessible disponible [ici](https://github.com/Projet-INFO-S10/Domus-docs/blob/main/Meross/key_generator.sh)
Pour lancer le script:
    
    ./key_generator.sh

## Modification des rêgles du pare feu

Pour permettre la communication à travers le pare feu:
- sudo ufw allow from any to any port 8883 proto tcp
- sudo ufw allow from any to any port 8884 proto tcp

# Contrôle de la prise
Afin de contrôler la prise MSS310, il suffit d'exécuter le script disponible dans le dossier Meross/bin/meross-command:
    
    ./meross-command
 
Il est nécessaire de spécifier l'adresse IP de la prise. 

### References
Le repository github de [arandall](https://github.com/arandall/meross/blob/main/doc/protocol.md#appliancesystemall) nous a servi de documentation pour la communication avec les prises Meross (Format des paquets, signature...)
