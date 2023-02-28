# Notice - Installation des capteurs à l'aide de fichiers

Tout d'abord, certaines technologies ne sont pas compatibles avec l'utilisation de fichier pour être ajoutés, notamment ceux qui doivent utiliser la méthode de découverte automatique [Voir ici](https://www.openhab.org/docs/configuration/things.html)
Dans notre cas, ce tutoriel ne pourra donc fonctionner avec les capteurs de type Z-Wave.

## Différence entre Things et Items

Les things representent la partie physique, ils representent les entité physiques en elle même et lesquelles doivent être gerés par OpenHab. Les things sont connectés à l'aide d'un bindings qui doit être choisis pour pouvoir ajouter le things.
Les items representent toutes les propriétés et possibilités offerte pour OpenHab par un objet

## Localisation des fichiers .things

Pour trouver ou placer les fichiers .things, taper dans le terminal:

```
echo $OPENHAB_CONF
```

Les fichiers .things seront à placer dans le repertoire: 

**$OPENHAB_CONF/things**


## Localisation des fichiers .items

Pour trouver ou placer les fichiers .things, taper dans le terminal:

```
echo $OPENHAB_CONF
```

Les fichiers .items seront à placer dans le repertoire: 

**$OPENHAB_CONF/items**


## Récupération des fichiers


Dans notre cas, ces fichiers ont déjà été crées et sont donc accessibles [ici les things](https://github.com/Projet-INFO-S10/Domus-docs/tree/main/Things) et [ici les items](https://github.com/Projet-INFO-S10/Domus-docs/tree/main/Items)

## Mise en place des fichiers

Une fois les fichiers récuperés:
Pour le fichier *Door.things*, il est nécessaire de rajouter le mot de passe et le username pour permettre la communication avec CampusIoT.
, les mettres dans les dossier nécessaires: 
- Pour les fichiers things: **$OPENHAB_CONF/things**
- Pour les fichiers items: **$OPENHAB_CONF/items**

Une fois cela fait, ils seront automatiquements ajoutés à OpenHab et utilisables.

⚠️ Dans les fichiers .things, les étoiles sont à compléter avec vos valeurs ( par exemple pour le compte netatmo les valeurs de client ID et client secret associées à votre compte).
