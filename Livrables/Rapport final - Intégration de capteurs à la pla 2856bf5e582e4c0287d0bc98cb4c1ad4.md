# Rapport final - Intégration de capteurs à la plaforme Domus

*Projet Semestre 10 - Informatique année 5 - Polytech Grenoble*
<div align="center">
  <img align="right" src="Rapport%20final%20-%20Inte%CC%81gration%20de%20capteurs%20a%CC%80%20la%20pla%202856bf5e582e4c0287d0bc98cb4c1ad4/Untitled.png" width="300"/>
</div>

**Porteurs de projet :** LIG - Sybille CAFFIAU - Mélissa COURLA

**Auteurs :** BRETON Emeric, LAVIROTTE Gaëtan, PELISSE-VERDOUX Cyprien , VIALLET Camille

---

## 1. Rappel du sujet et cahier des charges

Le besoin de ce projet est d'ajouter de nouveaux capteurs à la plateforme Domus basée sur openHAB. La plateforme Domus est un appartement connecté situé dans la Maison de la création et de l'Innovation sur le campus de Saint-Martin-d'Hères.

Les capteurs sont au cœur de cette solution, car ils permettent de collecter des données sur l'environnement de la maison, telles que la température, l'humidité ou la présence de personnes, pour permettre l'automatisation des fonctions de la maison. Par exemple, lorsque la température extérieure baisse, la maison peut allumer le chauffage pour maintenir une température confortable à l'intérieur.

Les objectifs du projet étaient :

- L’installation de capteurs fournis par les porteurs de projets
- La réalisation de notices et de la documentation nécessaires à l’installation des capteurs

## 2. Technologies employées

### 2.1 OpenHAB

OpenHAB est une plateforme de centralisation d’appareils connectés variés. Ainsi, la plateforme permet de regrouper aussi bien des capteurs (comme des capteurs de mouvements, des caméras ou encore des détecteurs de luminosité) que des actionneurs comme des volets roulants, des lampes ou autres.

La plateforme sert de hub aux différents protocoles que les différents objets peuvent utiliser, par exemple LoRaWAN, MQTT, ou encore le Bluetooth. La diversité des protocoles accessible est due au grand nombre de plugins et extensions disponibles.

Une fois que les différents objets sont ajoutés, il est alors possible de rajouter des règles et scénarios permettant de faire interagir entre eux les objets, pour automatiser certaines tâches, par exemple lorsqu’un mouvement est détecté, une lumière s’allume et le chauffage se lance.

Le fonctionnement et l’utilisation d’openHAB peuvent-être découpés en plusieurs parties :

Pour la configuration, il existe une interface web proposée par le logiciel qui permet de définir les appareils et systèmes qui seront connectés, leurs protocoles de communication et les paramètres utilisés. Il est à noter que des fichiers de description peuvent également être utilisés pour rajouter ces mêmes appareils et systèmes au logiciel. C’est à cette étape que les règles et les scénarios seront éventuellement créé pour répondre à un besoin particulier.

Pour la communication, la plateforme utilise les différents protocoles configurés pour communiquer avec les objets et recevoir les informations. Informations qui pourront donc ensuite être mise en forme pour un affichage personnalisé.

Grâce à la richesse des plugins et extensions disponibles, certains appareils peuvent être contrôlés depuis l’interface d’openHAB. Certains assistants vocaux comme Alexa d'Amazon ont une intégration à openHAB qui permet d’utiliser aussi les commandes vocales pour contrôler les appareils.

### 2.2 ZWave

Z-Wave est un des protocoles de communication sans fil que nous avons utilisé pour brancher certains capteurs qui nous ont été confiés. Cette technologie permet de créer des réseaux maillés qui sont bien adaptés à de la domotique comme notre plateforme. 

<div align="center">
  <img src="Rapport%20final%20-%20Inte%CC%81gration%20de%20capteurs%20a%CC%80%20la%20pla%202856bf5e582e4c0287d0bc98cb4c1ad4/Untitled%201.png" width="500"/>
</div>
  
En effet, un produit Z-Wave va transmettre le signal à un autre jusqu'à que la destination finale soit atteinte. Dans notre cas, la destination finale est une clé USB qui sert d’antenne et de relai entre la plateforme openHAB et le réseau Z-Wave. La bande de fréquence sur laquelle opère Z-Wave permet de ne pas empiéter sur celle du wifi et donc aucune interférence n’est à déplorer de ce côté-là. D’un point de vue efficacité énergétique, la technologie est faite de manière à économiser la consommation énergétique et ainsi la consommation. La durée de vie de la batterie s’en retrouve ainsi augmentée. Une autre force de cette technologie est la diversité des capteurs disponibles. Ainsi, nous avons pu en tester plusieurs. Nous avons eu un détecteur d’inondation, un détecteur de mouvement ou encore un interrupteur à 4 touches. Cette diversité de produit permet d’utiliser de nombreux objets Z-Wave qui permettent de renforcer le réseau maillé proposé par la technologie.

### 2.3 Bluetooth

La technologie Bluetooth est une technologie de communication sans fil qui permet l’échange de donnée entre divers appareils. Elle est utilisée dans de nombreux équipements de la vie de tous les jours comme les écouteurs sans fils ou encore les montres connectées. Les ondes utilisées sont des ondes permettant une communication courte distance de l’ordre d’une dizaine de mètres, mais cette distance peut aller théoriquement jusqu'à environ 100m. La consommation de cette technologie radio lui permet d’être utilisé pour les objets connectés. Dans notre cas, les capteurs utilisant cette technologie étaient un pèse-personne ainsi qu’une ampoule haut-parleurs. Un autre atout qu’a le Bluetooth est qu’il est intégré dans les smartphones d’aujourd’hui, l’objet peut donc être bien plus facilement contrôlé depuis un smartphone avec des applications proposées par le constructeur de l’objet. Ce qui en fait une force du fait que généralement le smartphone reste à portée de main, il est ainsi facile de suivre les dernières informations sans se connecter au serveur openHAB. Un point négatif est que du matériel supplémentaire peut être nécessaire pour faire communiquer le serveur openHAB et les objets si l’hôte d’openHAB n’a pas accès directement à une interface Bluetooth pour communiquer.

### 2.4 LoRaWAN

La technologie LoRaWAN pour Long Range Wide Area Network est une technologie de réseau sans fil conçue pour l'Internet des objets (IoT). La conception de cette technologie d’être très économe en énergie tout en permettant une communication longue distance. LoRaWAN s’appuie sur une modulation de fréquence avec étalement de spectre adaptable pour offrir le meilleur débit. La distance de communication peut s’étaler sur plusieurs kilomètres, dans des conditions optimales, cela peut représenter plusieurs dizaines de kilomètres. Dans un usage urbain avec des obstacles, la portée pourra se retrouver réduite. Ce genre de capteur est idéal pour des capteurs de monitoring qui doivent périodiquement envoyer des données. Dans notre cas, nous avions eu un capteur de porte qui fonctionnait à l’aide de la technologie LoRaWAN. Pour le fonctionnement du capteur, lorsqu’il reçoit un signal de mouvement de porte, il envoie le signal tout autour de lui. Une ou plusieurs passerelles reçoivent le signal et le transmettent au réseau de serveurs, puis après d’éventuels traitements, il sera envoyé au bon endroit.

`Organisation d’un réseau IoT avec LoRaWAN:`


<div align="center">
  <img src="Rapport%20final%20-%20Inte%CC%81gration%20de%20capteurs%20a%CC%80%20la%20pla%202856bf5e582e4c0287d0bc98cb4c1ad4/Untitled%202.png" width="700"/>
</div>

### 2.5 MQTT

La technologie MQTT pour Message Queuing Telemetry Transport a été utilisé de notre côté pour le capteur de porte et les prises Meross, c’est un protocol conçu pour les applications IoT. Il permet la transmission de messages même avec des capacités de calcul et de stockage réduites. MQTT fonctionne sur un modèle de publication et d’abonnement. Les clients se connectent à un serveur MQTT central et peuvent publier des messages sur des topics ou alors s’abonner à ces mêmes topics pour en recevoir les informations publiées. MQTT est un bon choix dans le domaine de l’IoT, car il est léger et facile à implémenter. En effet, les données qui transitent sur le réseau sont généralement de petite taille et si besoin est, une qualité de service peut être mise en place pour que la transmission de message atteigne une certaine fiabilité.

## 3. Architecture

Dans notre cas, l’architecture n’a pas été choisie par nous, elle dépend du logiciel que nous utilisons ici : openHAB. 

### 3.1 OpenHAB

OpenHAB utilise une architecture distribuée basée sur le modèle client-serveur pour créer un système domotique évolutif et flexible. Cette architecture permet de connecter divers types de périphériques et de systèmes liés à la “maison connectée” à une plateforme centrale qui gère la communication et la coordination entre eux.

Dans l'architecture openHAB, la plateforme centrale est appelée "openHAB Runtime" ou "openHAB Server". Il s'agit d'un serveur Java qui gère les règles de la maison, la logique et l'interface utilisateur. Les périphériques domotiques sont connectés à l'openHAB Server via des "bindings" qui sont des extensions logicielles qui permettent de communiquer avec différents types de protocoles et de technologies.

Les utilisateurs interagissent avec le serveur openHAB via des clients openHAB, qui sont des interfaces utilisateur personnalisables qui permettent de contrôler et de surveiller les périphériques domotiques connectés. Les clients peuvent être exécutés sur divers appareils, notamment des ordinateurs de bureau, des smartphones et des tablettes.

L'architecture distribuée d'openHAB permet de créer un système domotique évolutif qui peut s'adapter aux besoins de l'utilisateur et aux nouvelles technologies et périphériques domotiques qui apparaissent sur le marché.

### 3.2 Docker

Afin de permettre une meilleure portabilité de la plateforme openHAB, il a été décidé en partenariat avec les porteurs de projet de conteneuriser l’application existante. Pour cela, nous avons créé le script bash dockerize.sh et le fichier docker-compose.yml. Ces fichiers permettent de cloner le repository gitlab de Domus pour récupérer les fichiers de configuration openHAB (.things et .items), créer le conteneur via l’image officielle d’openHAB disponible sur Dockerhub.

Pour cela, nous avons créé le script bash dockerize.sh et le fichier docker-compose.yml. Ces fichiers permettent de cloner le repository gitlab de Domus pour récupérer les fichiers de configuration openHAB (.things et .items). Le script permet ensuite de créer le conteneur via l’image officielle d’openHAB disponible sur Dockerhub.

`Architecture :`
<div align="center">
  <img src="Rapport%20final%20-%20Inte%CC%81gration%20de%20capteurs%20a%CC%80%20la%20pla%202856bf5e582e4c0287d0bc98cb4c1ad4/Architecture.jpg" width="700"/>
</div>

## 4. Réalisation technique

Nous avons mis en place plusieurs capteurs utilisant les différentes technologies présentées au préalable dans le cadre de notre projet. Ces différents capteurs répondent à des besoins spécifiques au sujet de la maison connectée.

### OpenHAB

En ce qui concerne l’installation d’openHAB, nous avons envisagé plusieurs solutions. Tout d’abord, afin d’avoir un environnement commun, nous avons souhaité réaliser un Docker dans lequel nous avons implémenté un openHAB. Dockeriser le serveur était fonctionnel pour les premiers capteurs, comme le capteur de porte ou le capteur de qualité de l’air, puisqu’ils ne nécessitaient aucune connexion avec l’ordinateur support. Cependant, lorsque l’on a eu besoin d’activer des capteurs avec Z-Wave, ceux-ci nécessitaient comme support une clé USB qui permettaient de faire la liaison avec un serveur openHAB non-dockerisé, ce qui nous a obligé à changer notre méthode d’utilisation openHAB. Ainsi, nous avons utilisé ce serveur en local sur un environnement Linux, afin de pouvoir faire fonctionner l’ensemble des capteurs directement dessus. Cependant, nous avons également cherché des solutions afin de voir s’il était possible de faire fonctionner notre projet sous un environnement Docker.

### Capteur de porte

Tout d’abord, le premier capteur que nous avons eu à notre disposition a été un capteur de porte, permettant notamment de vérifier l’état de celle-ci (ouverte ou fermée). Pour mettre en place celui-ci, nous avons dû obtenir la connexion à CampusIoT, sur lequel le capteur était déjà connecté et envoyait des données, via LoRa. En effet, il avait déjà été pré-enregistré, et il était en mesure d’envoyer des données à une antenne LoRa, qui était elle-même reliée à CampusIoT. Nous n’avons donc pas eu besoin de travailler sur la communication LoRaWAN.

Cependant, pour faire la liaison entre CampusIoT et openHAB, nous avons eu besoin d’utiliser un autre moyen de communication reconnu par openHAB, ici MQTT. OpenHAB possède un principe de Binding, qui permet d’héberger les connexions (liaisons) avec différentes technologies externes. Le Binding MQTT étant inclus et facile d’utilisation, nous avons pu faire la liaison entre le serveur et les données de campusIoT. Pour établir cette liaison, il faut avoir le nom d’hôte sur lequel on veut se connecter (ici campusIoT), un nom d’utilisateur et un mot de passe, qui nous ont été fournis par Mr. Donsez, administrateur de cette plateforme campusIoT.

De ce fait, lorsque la connexion est créée, on peut maintenant ajouter un “topic”, qui dans notre cas représente le capteur pour lequel on veut obtenir les données. OpenHAB permet de créer des objets génériques MQTT qui récupèrent des données. Ceux-ci peuvent avoir des “channels”, outils utilisés pour récupérer chaque élément que l’on veut avoir. Dans notre cas, l’objet générique est le capteur de porte, lié au Broker précédemment créé pour la liaison avec campusIoT. Les channels permettent d’obtenir le nombre d’ouvertures de la porte, son état actuel ou bien encore la date du dernier mouvement. Toutes ces informations sont utiles pour ce capteur.

`Capteur de porte Dragino LDS02 :`
<div align="center">
  <img src="https://media.elektor.com/media/catalog/product/cache/9cc822bfc6a57f9729d464b8b5e0e0df/d/r/dragino_lds02_-_top_view.jpeg" width="200"/>
</div>
  
### Capteur de qualité de l’air Netatmo

Par la suite, nous avons eu à notre disposition un capteur de qualité de l’air Netatmo. Celui-ci a pour but de vérifier différents facteurs tels que le bruit ambiant, la température ou encore l’humidité dans la pièce.

Ce capteur n’a pas été extrêmement compliqué à installer sur openHAB puisqu’il existe déjà un Binding Netatmo qui permet d’établir cette connexion. Cependant, il y a quelques paramétrages à effectuer, notamment via l’application mobile Netatmo, qui est nécessaire pour le bon fonctionnaire du capteur. 

Il est également nécessaire de créer une application sur le site développeur de Netatmo, afin d’obtenir des identifiants qui seront à fournir lors de la liaison avec le compte sous openHAB. Lorsque ceci est fait, il est alors de créer un objet “account” sous openHAB, qui sera un Bridge pour la connexion avec le capteur. Lorsque ce Bridge est créé, il est alors possible d’établir sous openHAB la connexion avec le capteur, en choisissant le bon type de capteur (ici, il s’agit d’un home-coach), et en fournissant l’adresse MAC du capteur, qui est trouvable sur l’application mobile précédemment utilisée.

Avec toutes ces informations, le capteur est maintenant disponible sur openHAB et peut transmettre les informations que l’on souhaite, en créant des channels qui font la liaison avec chaque information du capteur, pour ne garder que les données que l’on souhaite. Cela se fait facilement sous l’interface utilisateur d’openHAB.

`Capteur de qualité de l’air Netatmo :`

<div align="center">
  <img src="https://www.cosmoselectro.ma/storage/sliders/netatmo-air.PNG" width="200"/>
</div>

### Capteurs Z-Wave

Nous avons également eu d’autres capteurs, basées sur la technologie Z-Wave (présentée dans une partie précédente), qui nous ont été fournis pour notre projet. À l’instar des précédents capteurs, ceux-ci se basaient également sur une technologie directement liable à openHAB, ce qui nous a facilité la tâche. En effet, il existe un binding Z-Wave permettant de connecter non seulement les capteurs, mais également le Bridge par principe de découverte.

Contrairement à précédemment, il était cette fois nécessaire d’avoir un support matériel pour effectuer la connexion avec openHAB. Là où MQTT faisait directement la connexion entre le serveur et campusIoT, et là où Netatmo faisait la liaison via une application mobile, la connexion avec la technologie Z-Wave se fait via une clé USB qui réceptionne l’envoi de données des différents capteurs. AInsi, il faut qu’openHAB puisse lire les données entrantes du port USB de la machine serveur. Nous avons essayé de modifier le Dockerfile pour faire en sorte d’avoir une reconnaissance du port USB, mais nous nous sommes rapidement rendus compte que ceci n’était pas réellement faisable, et les recherches sur les forums spécialisés nous ont confirmés que ceci était difficilement implémentable. De ce fait, nous nous sommes intéressés à la configuration sur laquelle se trouvait le serveur openHAB Domus, et nous avons appris qu’il n’utilisait pas Docker, n’étant que sur un environnement Linux classique. C’est à ce moment que nous avons décidé de changer notre manière de travailler pour passer sur un environnement Linux simple, sans Docker.

Depuis ce serveur openHAB, nous étions donc en mesure de lire les données du port USB, et nous nous sommes rapidement rendus compte que l’appareillage avec la clé USB était simple à faire, par principe de découverte. Ce principe permet au matériel (Bridge ou capteur) d’envoyer des demandes de connexion au serveur, et il est ainsi possible pour l’utilisateur de créer un objet à partir de la demande de connexion.

Lorsque ceci est fait, il faut maintenant appareiller tous les capteurs à la clé USB, pour qu’ils soient en mesure d’envoyer des données sur celle-ci. Chaque capteur a sa propre méthode, et nous avons donc cherché la documentation pour les ajouter. Par la suite, de la même manière que pour la clé, nous avons attendu que le serveur openHAB “découvre” les capteurs, pour pouvoir les ajouter sur le serveur et établir la connexion pour la récupération des données souhaitées.

Les capteurs que nous avons utilisés avec Z-Wave sont le Flood Sensor, un capteur qui vérifie si la pièce est inondée, le Motion Sensor, un capteur qui vérifie les mouvements dans la pièce, le Metered Wall Plug, une prise permettant de vérifier la consommation électrique de l’appareil branché, le Wallmote Quad, un capteur avec quatre touches sur lequel on peut définir des actions dans la maison, et enfin un bouton qui n’était pas fonctionnel.

`Flood sensor :`
<div align="center">
  <img src="https://smart-itc.de/wp-content/uploads/2019/12/fibaro-flood-sensor-z-wave.jpg" width="200"/>
</div>

`Motion Sensor :`
<div align="center">
  <img src="https://cdn.shopify.com/s/files/1/0218/7704/products/fibaro-fgms_001-z_wave-plus-motion-sensor-profile_2780a3c6-15f8-4f7f-b381-a8f17ecd93a2_1024x1024.jpg?v=1508323658" width="200"/>
</div>

`Metered Wall Plug Switch :`
<div align="center">
  <img src="https://cdn.alarme-maison-sans-fil.fr/media/catalog/product/cache/1/image/602f0fa2c1f0d1ba5e241f914e856ff9/f/g/fgwpe-102_zw5_eu_1_.jpg" width="200"/>
</div>

`Wallmote Quad :`
<div align="center">
  <img src="https://cdn.shopify.com/s/files/1/0066/8149/3559/products/zw130_2_700x700.jpg?v=1569287679" width="200"/>
</div>

### Ampoule haut-parleur Sengled

Après avoir terminé l’installation des capteurs précédents et avoir vérifié qu’ils étaient fonctionnels au laboratoire Domus, nous nous sommes concentrés sur les ampoules haut-parleur de Sengled. Cependant, comme c’était le cas pour les capteurs Z-Wave, l’interaction entre les deux sur un openHAB dockerisé est infaisable, puisqu’il est impossible d’accéder à la connexion Bluetooth d’un ordinateur depuis Docker, d’après nos recherches et des forums spécialisés. Une fois de plus, nous avons donc dû travailler sur un serveur openHAB sur un environnement Linux. En utilisant le principe de découverte, il est alors possible de non seulement reconnaître l’ordinateur, qui sert de Bridge pour la connexion Bluetooth, mais également les ampoules. 

Ces ampoules servent à faire de la lumière, mais également en tant que haut-parleur pour diffuser des messages dans la pièce.

Par la suite, nous avons trouvé un autre moyen de créer de l’interaction entre openHAB et l’ampoule connectée. En effet, il existe sur un openHAB un principe de rules, c’est à dire des actions qui s’effectuent lorsque quelque chose arrive à un élément (une activation, un changement de valeur, etc…). En créant des items directement sur le serveur, il est possible d’effectuer des rules qui s’active lors du changement de valeur manuellement pour ces items, ce qui permet en conséquence l’exécution de scripts. Dans ces scripts, nous avons eu la possibilité d’envoyer des valeurs hexadécimales, permettant de modifier la luminosité et le volume de l’ampoule, ce qui a résolu notre problème.

`Ampoule haut-parleur Sengled :`
<div align="center">
  <img src="https://www.coquediscount.com/46572-large_default/ampoule-solo-sengled-avec-haut-parleur-integre.jpg" width="200"/>
</div>

### Prise WiFi Meross

Un des objectifs du projet était la mise en place d’une prise WiFi Meross MSS310. Cette prise est contrôlable par l’application fournie par le constructeur et renvoie des données, comme la valeur de puissance instantanée fournie par la prise ainsi que ses informations. Il est également possible de l’activer ou de la désactiver à distance.

La prise se connecte par défaut au serveur de Meross à l’adresse : [https://iot.meross.com](https://iot.meross.com/) qui centralise les données et les redistribue aux utilisateurs propriétaires de la prise. Cependant, dans le cadre du projet, il est souhaitable que les données reste dans un réseau local. C’est pourquoi nous avons mis en place une architecture permettant l’accès à la prise localement. Nous avons donc mis place un broker mqtt dans un conteneur afin de recueillir les données de la prise et pouvoir la contrôler en nous abonnant et en publiant sur les topics permettant la communication avec l’appareil. De plus, la prise nécessitait d’utiliser le protocole mqtts (mqtt over TLS) afin d’avoir un canal de communication chiffré avec le broker. Nous avons donc mis au point un script bash utilisant OpenSSL pour générer les certificats SSL et les transmettre au conteneur du broker. Il est possible d’interagir avec la prise en s’abonnant au topic /appliance/<device-id>/publish afin de voir les paquets que celle-ci envoie et en publiant des messages sur le topic /appliance/<device-id>/subscribe.

En reliant openHAB au broker mqtt, nous avons pu recevoir les données renvoyées par la prise. Cependant, lorsque nous publiions un paquet sur le topic prévu à cet effet, la prise ne changeait pas d’état ou ne renvoyait pas de données. Ceci rendait alors impossible l’intégration de la prise dans openHAB malgré l’utilisation du binding mqtt.

Afin de pouvoir malgré tout contrôler la prise, nous avons développé un programme javascript a partir du repository github bytespider/Meross qui envoie les paquets via http à la prise WiFi. Par manque de temps, nous n’avons pas réussi à implémenter cela dans openHAB mais il semble possible d’utiliser le binding http de openHAB combiné à notre script pour pouvoir contrôler la prise via openHAB.

<div align="center">
 <img src="Rapport%20final%20-%20Inte%CC%81gration%20de%20capteurs%20a%CC%80%20la%20pla%202856bf5e582e4c0287d0bc98cb4c1ad4/4171eab1-smart-wi-fi-plug-mss310__450_400.jpg" width="200"/>
</div>

## 5. Gestion de projet

### 5.1 Méthode

L’avancée du projet a été très progressive. Nous avons eu des réunions hebdomadaires avec le client qui nous a fourni les capteurs à chaque étape. 

Notre projet c’est découpé en plusieurs sous-projets correspondant à l’intégration des capteurs utilisant une même technologie. Notre objectif était donc d’intégrer chaque catégorie de capteurs pour la semaine suivante.

***Etapes pour chaque projet :***

Pour chaque sous-projet, les étapes étaient les suivantes :

- Recherche sur la technologie employée et la méthode d’intégration avec openHAB
- Intégration des différents capteurs sur openHAB dans le Docker
- Rédaction des fichiers .items et .things
- Rédaction de la notice d’installation
- Test de la notice par un pair
- Test de l’intégration sur la plateforme Domus

Au vu du projet et du fait que nous n’avions pas les capteurs au fur et à mesure, il a été difficile de répartir les tâches. La plupart des étapes on donc été effectuées de manière collaborative.

### 5.2 Planning prévisionnel

Pour la gestion de projet, nous avons utilisé l’outil Notion. Celui-ci nous permet de créer des tâches que l’on peut attribuer aux différents membres du projet avec différentes dates d’échéance.

Dans notre cas, nous avions plusieurs capteurs à installer, fournis au fur et à mesure des réunions avec le client.  
<div align="center">
  <img src="Rapport%20final%20-%20Inte%CC%81gration%20de%20capteurs%20a%CC%80%20la%20pla%202856bf5e582e4c0287d0bc98cb4c1ad4/Untitled%203.png" width="700"/>
</div>
Ici, nous avons le Kanban correspondant aux tâches de l’installation de la lampe haut-parleur :
<div align="center">
  <img src="Rapport%20final%20-%20Inte%CC%81gration%20de%20capteurs%20a%CC%80%20la%20pla%202856bf5e582e4c0287d0bc98cb4c1ad4/Untitled%204.png" width="700"/>
</div>

### 5.2 Gestion des risques
<div align="center">
   <img src="Rapport%20final%20-%20Inte%CC%81gration%20de%20capteurs%20a%CC%80%20la%20pla%202856bf5e582e4c0287d0bc98cb4c1ad4/Untitled%205.png" width="700"/>
</div>

### 5.3 Rôle des membres

Comme évoqué plus haut, le projet ne se prêtait pas vraiment à une répartition stricte du travail et une bonne partie des tâches ont été effectuées de manière collaborative.

La répartition est donc la suivant :  

- Camille Viallet : Cheffe de projet / Développeur
- Emeric Breton : Développeur
- Gaëtan Lavirotte : Développeur
- Cyprien Pelisse-Verdoux : SCRUM Master / Développeur

L’ensemble des développeurs ont participé à l’ensemble des étapes nécessaires à l’installation des capteurs (lecture de documentation, rédaction de notice, installation). La gestion de projet a consisté en la répartition des tâches, l’élaboration du planning et la communication avec le client sur les besoins et l’avancée du travail.

## 6. Outils

Voir parties précédentes (2., 3., 5.) pour avoir une explication plus détaillée des outils de gestion, des capteurs et des technologies utilisées.

## 7. Métriques logicielles

Notre projet n’était pas un projet de développement, les seules parties de développement ont consisté en la création des fichiers de configuration .things et .items

Nombre de fichiers créés :

- 3 fichiers .things contenant environ 20 lignes de code chacun
- 3 fichiers .items contenant environ 25 lignes de code chacun
- 7 fichiers .rules contenant environ 15 lignes de code chacun
- 6 notices d’installation
- 3 scripts pour Meross contenant environ 50 lignes de code chacun

### 7.2 Répartition des lignes de code et des commits

Le total de lignes que nous avons produits dans le cadre de ce projet est donc d’environ 390 lignes, sans compter les notices d’utilisation. Ce total est très faible compte tenu du sujet, cependant nous avons dû faire de nombreuses recherches afin de faire fonctionner chaque capteur, et une grande partie de notre travail se faisait directement via l’interface utilisateur d’openHAB ou via les capteurs, ce qui représentait une charge de travail non visible dans les lignes de code.

En ce qui concerne le nombre de commits, celui-ci est encore une fois assez peu représentatif de la répartition du travail au sein du groupe. En effet, comme nous n’avions pas énormément de capteurs à traiter en même temps, nous étions amenés à travailler en duo ou même en groupe complet, ce qui peut expliquer pourquoi les commits étaient majoritairement faits par certaines personnes. De plus, nous avions besoin d’utiliser certaines technologies (telles que Z-Wave ou le Bluetooth) sur un openHAB Linux plutôt que sur un openHAB dockerisé (afin d’avoir une configuration semblable à celle de Domus), ce qui n’était possible que sur un seul ordinateur dans le groupe, d’où notre travail commun.

### 7.3 Langages

La syntaxe utilisée est propre à openHAB, nous avons donc du créer ces fichiers en s’adaptant à la syntaxe précisée dans les documentations openHAB suivantes :

[Items](https://www.openhab.org/docs/configuration/items.html)

[Things](https://www.openhab.org/docs/configuration/things.html)

### 7.4 Temps ingénieur

En moyenne, nous avons estimé un travail hebdomadaire en moyenne d’une durée de 30h/ semaine. 

Sur les 7 semaines que comporte le projet avec 4 personnes dans le projet, cela représente donc 840 h de travail.

## 8. Conclusion

Ce projet a été un moyen pour nous de découvrir openHAB et les solutions que ce type d’outil peut offrir, en centralisant la connexion à des capteurs utilisant différentes technologies et provenant de différents fabricants.

Nous sommes satisfaits de nos résultats, ayant été en mesure d’implémenter la majorité de nos capteurs, mais nous sommes déçus de ne pas avoir eu plus de temps pour explorer les possibilités de communication avec les prises Meross, qui ne sont pas complètement fonctionnelles et que nous aurions aimé plus approfondir.

Ce projet a également été une manière pour nous d’avoir une nouvelle expérience de travail dans un contexte d’ingénierie, avec une organisation et une gestion nécessitant une rigueur se rapprochant d’un travail en entreprise.

## 9. Références

Concepts généraux :

- [Concepts. (s. d.). openHAB](https://www.openhab.org/docs/concepts/)
- [Configuration. (s. d.). openHAB](https://www.openhab.org/docs/configuration/)

MQTT :

- [MQTT - Bindings . (s. d.). openHAB](https://www.openhab.org/addons/bindings/mqtt/)
- [Instructables. (2021, 16 mars). MQTT on Openhab 3 Tutorial.](https://www.instructables.com/MQTT-on-Openhab-3-Tutorial/)

Netatmo :

- [K. (2021, 15 mars). Test du capteur de Qualité de l’air Intérieur Netatmo. Blog Nord-Domotique](https://blog.nord-domotique.com/test-capteur-qualite-air-netatmo/)
- [Netatmo - Bindings. (s. d.). openHAB](https://www.openhab.org/addons/bindings/netatmo/)

ZWave :

- [ZWave - Bindings. (s. d.). openHAB](https://www.openhab.org/addons/bindings/zwave/)
- [Manuel Munier. (2021, 11 janvier). openHAB 3.0 - installation et configuration de périphériques Z-Wave. Page personnelle de Manuel Munier](https://munier.perso.univ-pau.fr/tutorial/iot/2021/20210111-openhab3_zwave_part01/)
- [O. (s. d.). org.openhab.binding.zwave/things.md at main · openhab/org.openhab.binding.zwave. GitHub](https://github.com/openhab/org.openhab.binding.zwave/blob/main/doc/things.md)
- [N. (2021b, juin 20). Guide de l’utilisateur AeoTec Z-Stick Gen5. Manuals+](https://fr.manuals.plus/aeotec/z-stick-gen5-manual#axzz7siduX43B)

Balance connectée Withings :

- [🩺 Public API | Withings. (s. d.).](https://oauth.withings.com/developer-guide/v3/withings-solutions/app-to-app-solution/)
- [Withings - Bindings. (s. d.). openHAB](https://v2.openhab.org/addons/bindings/withings1/)
- [I. (s. d.-a). Connect your openHAB and Withings. IFTTT](https://ifttt.com/connect/openhab/withings)
- [IFTTT Integration | openHAB. (s. d.)](https://www.openhab.org/docs/ecosystem/ifttt/)
- [O. (2022, 5 avril). [openhabcloud] Move « Items to Expose » option to advanced settings · Issue # 12582](https://github.com/openhab/openhab-addons/issues/12582)

Balance LidL:

- [O. (2023, 13 mars). GitHub - oliexdev/openScale : Open-source weight and body metrics tracker, with support for Bluetooth scale](https://github.com/oliexdev/openScale)
- [C. (2023, 24 février). Use case : Connecting a bathroom body (fat) scale (e.g. Medisana BS440) via Bluetooth / MQTT to openHAB - Step by step instruction. openHAB Community](https://community.openhab.org/t/use-case-connecting-a-bathroom-body-fat-scale-e-g-medisana-bs440-via-bluetooth-mqtt-to-openhab-step-by-step-instruction/143296)

Transformation en .items et .things à partir de la version UI :

- [D. (s. d.-a). GitHub - daabm/OpenHab. GitHub](https://github.com/daabm/OpenHab)

Lampe Sengled Solo Pulse :

- [Controlling a Bluetooth LED strip with HA. (2022, 1 juin). Home Assistant Community](https://community.home-assistant.io/t/controlling-a-bluetooth-led-strip-with-ha/286029/17)

Prise Meross :

- [B. (2022, 22 décembre). GitHub - bytespider/Meross : Investigating the Meross MSS310 Smart Plug and getting Meross devices to communicate with our private MQTT broker](https://github.com/bytespider/Meross)
- [A. (2022, 13 décembre). GitHub - arandall/meross : Tools to manage your Meross devices on your own infrastructure](https://github.com/arandall/meross)
- [Using a Meross Wi-Fi switch with OpenHab2. (2020, août 4)](https://theriom.com/post/Meross-switch-with-openhab/)
