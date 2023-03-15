# Intégration LoRaWAN à la plateforme Domus

Porteurs et encadrants (Prénom, Nom, Institution, Adresse email)

    Sybille Caffiau, UGA/LIG, sybille.caffiau AT univ-grenoble-alpes DOT fr
    Melissa Courla, UGA, melissa.courla AT univ-grenoble-alpes DOT fr

## Description du contexte

Le LIG dispose d’un espace équipé de capteur pour la réalisation d’étude (https://www.liglab.fr/fr/recherche/plateformes/domus). Les capteurs (ex : capteurs de CO2, de température) et effecteurs (ex : prises connectées, lumières) présents dans cet espace permettent soit de simuler de l’activité (pour étudier le comportement humain), soit d’obtenir des traces d’activité dans un environnement.

Pour cela, tous les capteurs et effecteurs et les logiciels qui permettent de les contrôler communiquent via un serveur Openhab (https://www.openhab.org). Openhab permet d’intégrer et d’abstraire différents protocoles (Zwave, KNX, EnOcean…), d’écrire des programmes (comme : lorsqu’il y a quelqu’un dans la salle de bain, alors allumer la lumiere) et d’obtenir une homogénéisation des traces d’activités (ie : les logs). L’installation actuelle contient de nombreux capteurs et effecteurs cependant il reste des dispositifs qui ne sont pas encore intégrés comme en particulier des capteurs LoRaWAN activés sur des réseaux tels que CampusIoT, TTN, Helium ou bien Orange.

Le protocole LoRaWAN, par exemple, a pour particularité de permettre la communication à longue distance ou deep indoor et d’être très peu couteux en consommation énergétique, intégrer des capteurs qui s’appuient sur ce protocole permettrait d’envisager des scénarios s’appuyant sur des espaces distants. Par exemple, nous pourrions simuler que lorsqu’un habitant quitte son lieu de travail (son bureau), l’information soit automatiquement transmises à l’habitat qui monte le chauffage, monte les stores…
Objectif(s) du projet

L’objectif du projet est d’intégrer différents capteurs LoRaWAN (tels que des capteurs de porte LoRaWAN Dragino LDS02, capteurs reprogrammables Idosens ...) et d’autres types de capteurs (tels que les prises connectées Wifi Meross, la balance BLE LIDL ...) dans le système OpenHab de Domus)

## Travail attendu (5 lignes minimun) Les étudiants devront :

    Prendre en main toutes les technologies
    Tester et faire fonctionner les capteurs LoRaWAN dont nous disposons (communication via le réseau LoRaWAN CampusIoT)
    Tester et faire fonctionner les prises connectées Wifi Meross dont nous disposons
    Tester et faire fonctionner une balance connectée BLE LIDL dont nous disposons (priorité faible)
    Produire la documentation nécessaire à l’installation d’autres capteurs suivant ce même protocole
    Produire un binding pour faire le lien entre OpenHab et les équipements enregistrés sur des réseaux LoRaWAN (dont CampusIoT)

## Techniques, outils, technologies, langages et canevas à mettre en oeuvre.

    OpenHab
    LoRaWAN
