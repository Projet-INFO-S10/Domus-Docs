# Notice - Installation des ampoules haut-parleurs via Bluetooth

Tout d'abord, cette installation a été réalisée sur un serveur openHAB natif sur Linux, l'installation peut différer si l'environnement n'est pas le même. La page d'aide pour l'installation du binding Bluetooth dans openHAB se trouve [ici](https://www.openhab.org/addons/bindings/bluetooth/).

## Installation par reconnaissance des outils

Tout d'abord, il faut que l'ampoule soit allumée. Le Bluetooth doit également être activé sur l'ordinateur hébergeant le serveur openHAB, afin de pouvoir faire la liaison entre les deux.

Il est nécessaire d'activer le Bluetooth, et de sélectionner l'appairage avec **Pulse Solo C01-A66**, l'ampoule que nous souhaitons connecté dans notre cas.
Lorsque la connexion s'effectue, un bruit doit émaner de la lampe, signifiant que la liaison est active.

### 1. Ajout du binding Bluetooth sur openHAB

Dans la bande de gauche, sélectionner **Paramètres**, puis cliquer sur **Bindings**.
Dérouler la liste des bindings dans openHAB Distribution, et installer **Bluetooth Binding**.

### 2. Reconnaissance du bridge Bluetooth

Lorsque l'activation du binding est faite, il faut maintenant ajouter le support de reconnaissance Bluetooth, qui est ici notre propre ordinateur lié à la lampe haut-parleur.

Pour une installation sous Linux, le bridge à utiliser sera le [BlueZ Adpater](https://www.openhab.org/addons/bindings/bluetooth.bluez/), qui est spécifiquement adapté à Linux.
Pour d'autres installations, le bridge à utiliser sera plutôt le [BlueGiga Adapter](https://www.openhab.org/addons/bindings/bluetooth.bluegiga/).

Il faut aller dans **Paramètres**, puis **Things**.
Si tout fonctionne bien, le serveur openHAB est censé reconnaître la connexion Bluetooth de l'ordinateur, et un nouvel élément devrait arriver dans la boîte **Inbox**, en rouge en bas de la page. openHAB devrait proposer une Bluetooth Interface, que l'on peut ajouter en faisant **Add as a Thing**.

**NB**: Si le bridge n'est pas directement reconnu, alors il faut aller dans **things**, puis le **+** en bas à droite, **bluetooth binding** et enfin **scan** en haut de la page.
Normalement OpenHab devrait découvrir une thing bluetooth.

### 3. Reconnaissance de l'ampoule

Peu après la reconnaissance du bridge, en retournant sur la page **Things**, openHAB devrait proposer, dans **InBox** l'ajout des différents éléments auquel l'ordinateur peut se connecter, via Bluetooth. 

**NB**: Si l'objet n'est pas directement reconnu, alors il faut aller dans **things**, puis le **+** en bas à droite, **bluetooth binding** et enfin **scan** en haut de la page.
Normalement OpenHab devrait découvrir le **C01-A66_Pulse Solo**.

Il faut alors sélectionner l'ampoule **C01-A66_Pulse Solo**, et faire **Add as a Thing** pour l'ajouter au serveur.

Lorsque ceci est fait, en retournant dans **Things**, il est possible en sélectionnant notre objet ampoule d'aller ajouter une **Channel** (en haut de la page) qui permet de mesurer la force du signal reçu : En cliquant sur RSSI puis sur **Add Link to Item...**, puis en sélectionnant **Create a new Item**, et enfin en validant avec le bouton **Link** bleu, en bas de page.

Lorsque ceci est fait, la communication entre l'ordinateur (le bridge), et l'ampoule est complète et openHAB peut réceptionner la puissance du signal à n'importe quel moment.

**NB** : Le signal ne peut être réceptionné qu'à 10 mètres maximum, selon la notice de l'ampoule.

## Fichiers .items, .rules et script

En ce qui concerne notre utilisation de l'ampoule connectée, nous avons opté pour une autre stratégie, qui ne nécessite aucun ajout en Bluetooth à openHAB. Avec une simple utilisation d'items et de rules, il est donc possible de contrôler la lumière et le volume de l'ampoule sur openHAB.

Tout d'abord, il faut que l'ampoule soit allumée. Le Bluetooth doit également être activé sur l'ordinateur hébergeant le serveur openHAB, afin de pouvoir faire la liaison entre les deux.

Il est nécessaire d'activer le Bluetooth, et de sélectionner l'appairage avec **Pulse Solo C01-A66**, l'ampoule que nous souhaitons connecté dans notre cas.
Lorsque la connexion s'effectue, un bruit doit émaner de la lampe, signifiant que la liaison est active.

### 1. Création des items

Les items nécessaires pour le contrôle de l'ampoule sont disponibles dans le dossier [Items](https://github.com/Projet-INFO-S10/Domus-docs/tree/main/Items), et il faut récupérer le fichier **Sengled.items**.

Pour trouver où placer les fichiers .items, taper dans le terminal:

```
echo $OPENHAB_CONF
```

Les fichiers .items seront à placer dans le repertoire: 

**$OPENHAB_CONF/items**

L'item *Sengled_Light* permet d'activer ou désactiver la lumière (ON/OFF via un switch), *Sengled_Luminosity* permet de choisir son intensité (échelle de 0 à 100), *Sengled_Volume_Up* est un bouton qui permet d'augmenter le son à chaque changement d'état et *Sengled_Volume_Down* est un bouton qui permet de diminuer le son à chaque changement d'état.

### 2. Création du script

Nous avons trouvé un script permettant d'interagir directement avec l'ampoule, via gatttool, un outil permettant de manipuler et de lire les valeurs d'un appareil Bluetooth. A l'aide de l'adresse MAC de l'appareil (que l'on a), et d'un "handle" spécifique à gatttool, il est possible de contrôler les différents éléments que l'on souhaite, sans même avoir à intégrer l'ampoule sur openHAB. Le script est déjà prévu pour s'adapter à l'adresse MAC écrite dans les rules (nous y reviendrons plus tard), et le "handle" est par défaut à 0x0017, ce qui semble être, d'après notre expérience personnelle et nos recherches, celui permettant d'écrire des données.
Ce script peut-être placé n'importe où, il faut juste penser à donner les droits d'exécution à tout le monde sur celui-ci, ou bien à donner les droits d'owner à l'utilisateur openhab.

### 3. Création des rules

Les rules nécessaires pour le contrôle de l'ampoule sont disponibles dans le dossier [Rules](https://github.com/Projet-INFO-S10/Domus-docs/tree/main/Rules), et il faut récupérer les fichiers **Sengled_Light.rules**, **Sengled_Luminosity.rules**, **Sengled_Volume_Up.rules** et **Sengled_Volume_Down.rules**.

Pour trouver où placer les fichiers .rules, taper dans le terminal:

```
echo $OPENHAB_CONF
```

Les fichiers .rules seront à placer dans le repertoire: 

**$OPENHAB_CONF/rules**

Cependant, il y a quelques modifications à faire dans ces fichiers .rules. La première consiste, pour chacun d'entre eux, à modifier le chemin d'accès du script, en remplaçant l'existant par le chemin où se trouve le fichier. Ensuite, il faut aussi potentiellement modifier l'adresse MAC de l'ampoule à laquelle on souhaite se connecter.
Pour trouver cette adresse MAC, il faut taper la commande **bluetoothctl** dans un terminal, qui va lister l'ensemble des appareils bluetooth auquel on peut se connecter. Il faut alors récupérer l'adresse MAC de l'appareil *C01-A66_Pulse Solo* (ou nom équivalent), et remplacer toutes les mentions d'une adresse MAC dans les .rules par cette adresse MAC.
**NB :** Il y a 2 connexions Bluetooth possibles pour chaque ampoule : La première permet la connexion à l'ordinateur (comme n'importe quel appareil Bluetooth, pour envoyer du son par exemple), la deuxième permet l'envoi et la réception de données.
