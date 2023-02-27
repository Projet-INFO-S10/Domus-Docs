# Notice - Installation des ampoules haut-parleurs via Bluetooth

Tout d'abord, cette installation a été réalisée sur un serveur openHAB natif sur Linux, l'installation peut différer si l'environnement n'est pas le même. La page d'aide pour l'installation du binding Bluetooth dans openHAB se trouve [ici](https://www.openhab.org/addons/bindings/bluetooth/).

## Installation par reconnaissance des outils

Tout d'abord, il faut que l'ampoule soit en activité avec une lampe afin qu'elle fonctionne. Le Bluetooth doit également être activité sur l'ordinateur hébergeant le serveur openHAB, afin de pouvoir faire la liaison entre les deux.

Il est nécessaire d'activer le Bluetooth, et de sélectionner l'appairage avec *Pulse Solo C01-A66*, l'ampoule que nous souhaitons connecté dans notre cas.
Lorsque la connexion s'effectue, un bruit doit émaner de la lampe, signifiant que la liaison est active.

### 1. Ajout du binding Bluetooth sur openHAB

Dans la bande de gauche, sélectionner *Paramètres*, puis cliquer sur *Bindings*.
Dérouler la liste des bindings dans openHAB Distribution, et installer *Bluetooth Binding*.

### 2. Reconnaissance du bridge Bluetooth

Lorsque l'activation du binding est faite, il faut maintenant ajouter le support de reconnaissance Bluetooth, qui est ici notre propre ordinateur lié à la lampe haut-parleur.

Pour une installation sous Linux, le bridge à utiliser sera le [BlueZ Adpater](https://www.openhab.org/addons/bindings/bluetooth.bluez/), qui est spécifiquement adapté à Linux.
Pour d'autres installations, le bridge à utiliser sera plutôt le [BlueGiga Adapter](https://www.openhab.org/addons/bindings/bluetooth.bluegiga/).

Il faut aller dans *Paramètres*, puis *Things*.
Si tout fonctionne bien, le serveur openHAB est censé reconnaître la connexion Bluetooth de l'ordinateur, et un nouvel élément devrait arriver dans la boîte *Inbox*, en rouge en bas de la page. openHAB devrait proposer une Bluetooth Interface, que l'on peut ajouter en faisant *Add as a Thing*.

### 3. Reconnaissance de l'ampoule

Peu après la reconnaissance du bridge, en retournant sur la page *Things*, openHAB devrait proposer l'ajout des différents éléments auquel l'ordinateur peut se connecter, via Bluetooth. 
Il faut alors sélectionner l'ampoule *C01-A66_Pulse Solo*, et faire *Add as a Thing* pour l'ajouter au serveur.

Lorsque ceci est fait, en retournant dans *Things*, il est possible en sélectionnant notre objet ampoule d'aller ajouter une *Channel* (en haut de la page) qui permet de mesurer la force du signal reçu : En cliquant sur RSSI puis sur *Add Link to Item...*, puis en sélectionnant *Create a new Item*, et enfin en validant avec le bouton *Link* bleu, en bas de page.

Lorsque ceci est fait, la communication entre l'ordinateur (le bridge), et l'ampoule est complète et openHAB peut réceptionner la puissance du signal à n'importe quel moment.

*NB* : Le signal ne peut être réceptionné qu'à 10 mètres maximum, selon la notice de l'ampoule.

## Fichiers .things et .items

Il n'est pas réellement de préparer une installation avec des fichiers .things et .items car le bridge, nécessaire à la reconnaissance de l'ampoule, ne peut être obtenu que par découverte dans l'interface utilisateur d'openHAB. Sans le bridge, il n'est pas possible d'obtenir l'ampoule, on ne peut donc pas créer de .things dédié.
