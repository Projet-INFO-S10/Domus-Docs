# Notice - Installation des prises Merros

Pour cette notice, nous considérons un système d'exploitation Ubuntu.

# Clone du repository et configuration

Dans le [repository](https://github.com/Projet-INFO-S10/Domus-docs/tree/main/Docker), sont fournis tout le nécéssaire pour la mise en place d'un environnement containerisé d'un serveur MQTT sécurisé. Il faut donc utiliser les commandes suivantes:

    git clone https://github.com/Projet-INFO-S10/Domus-docs
    cd Meross


Pour lancer les tout le nécessaire, cela se fait avec la commande suivante:

    ./meross.sh

Suivre les infos du script.

# Configuration interne à OpenHab

Une fois que les étapes précendentes ont été effectués, un serveur MQTT sécurisé est mis en place sur 'hôte.

On suppose que le **MQTT bindings** a été installé précédement, sinon voir une des autres notices pour savoir comment faire. 

## Création du .things




## Création du .items



## Génération des certificats
Utiliser le script accessible à l'adresse [Mettre lien vers script]()
Pour lancer le script:
    
    ./key_generator.sh

## Modification des rêgles du pare feu

Pour permettre la communication à travers le pare feu:

    sudo ufw allow from any to any port 8883 proto tcp
    sudo ufw allow from any to any port 8884 proto tcp
