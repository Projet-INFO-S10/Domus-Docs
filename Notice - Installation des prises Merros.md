# Notice - Installation des prises Merros

Pour cette notice, nous considérons un système d'exploitation Ubuntu.

Attention ! Cette notice ne permet pour l'instant pas l'installation complète de la prise sur OpenHAB ! 

# Clone du repository et configuration

Dans le [repository](https://github.com/Projet-INFO-S10/Domus-docs/tree/main/Docker), sont fournis tout le nécéssaire pour la mise en place d'un environnement contenerisé d'un serveur MQTT avec communications chiffrées. Il faut donc utiliser les commandes suivantes:

    git clone https://github.com/Projet-INFO-S10/Domus-docs
    cd Meross

Pour lancer les tout le nécessaire, cela se fait avec la commande suivante:

    ./meross.sh

Suivre les infos du script.

Ce script va cloner le repository de Domus et notre fork du repository [repository](https://github.com/bytespider/Meross) qui permet la configuration et le contrôle de la prise Meross MSS310.

# Utilisation de la prise.

Une fois que la prise est correctement configurée, elle est alors connectées à un réseau, qui aura été choisi. Pour intéragire avec cette même prise, il est nécessaire d'être connecté sur le même réseau.

Nous avons écris notre programme en complétent un programme déjà existant pour rajouter de nouvelles possibilités. Il est à noté que toutes les possibilités de commandes ne sont pas couvertes car très nombreuses et elles changent en fonction des prises. Dans notre cas, un seul modèle de prise était à notre disposition à savoir les Meross **Meross MSS310**. 

Plusieurs possibilités sont proposés par le script accessible au chemin: **./bin/meross** ou le repertoire courant est celui du fork du repository effectué précédement. 

Pour voir la liste des commandes disponibles, la commande est la suivante: 

    ./bin/meross info --help

On peut ainsi voir que plusieurs options sont disponibles:

    Options:
    -V, --version            output the version number
    -g, --gateway <gateway>  Set the gateway address (default: "10.10.10.1")
    -u, --user <user-id>     Integer id. Only useful for connecting to Meross Cloud.
    -k, --key <shared-key>   Shared key for generating signatures (default: "")
    --include-wifi           Ask device for Nearby WIFI AP list
    --on                     Switch on the switch
    --off                    Switch off the switch
    --list                   Ask for the list of available data on the topic
    --history                Ask for the history of the power consumption
    --power                  Ask for the current power of the switch
    -v, --verbose            Show debugging messages (default: "")
    -h, --help               display help for command

Il est possible de mixer plusieurs options et leur comportement est décrit. 

L'option **--gateway** permets de préciser l'adresse de la prise Méross sur le réseau.

Un exemple pour allumer la prise, prise qui à l'adresse IP suivante: **192.168.47.103**

    ./bin/meross info --gateway 192.168.47.103 --on


Si l'option --gateway n'est pas fournis, ça sera l'adresse par défaut des prises (10.10.10.1) qui sera utilisé.

## Génération des certificats
Il est possible de générer des certificats en utilisant OpenSSL via le script key_generator.sh ce qui permet la communication chiffrée par TLS entre le broker mqtt et les clients.
Utiliser le script accessible à l'adresse [script](https://github.com/Projet-INFO-S10/Domus-docs/blob/main/Meross/key_generator.sh)
Pour lancer le script:
    
    ./key_generator.sh

## Modification des rêgles du pare feu

Pour permettre la communication à travers le pare feu:
- sudo ufw allow from any to any port 8883 proto tcp
- sudo ufw allow from any to any port 8884 proto tcp

## References
Le repository github de arandall nous a servi de documentation pour la communication avec les prises Meross (Format des paquets, signature...)
[repository](https://github.com/arandall/meross/blob/main/doc/protocol.md#appliancesystemall)
