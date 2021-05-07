Format d'équipement (JSON)
--------------------------

Les équipements supportés sont décrits dans des fichiers au format JSON, décrit ci-après.

Exemple:

  {
    "BASICZBR3": {
      "nameJeedom": "Sonoff BASICZBR3 smart switch",
      "manufacturer": "Sonoff",
      "model": "BASICZBR3",
      "timeout": "60",
      "Categorie": {
        "automatism": "1"
      },
      "configuration": {
        "uniqId": "5c07c7dsdssdd6625d94",
        "icone": "BASICZBR3",
        "mainEP": "#EP#"
      },
      "Commandes": {
        "include1": "SW",
        "include2": "societe",
        "include3": "nom",
        "include4": "etat",
        "include5": "On",
        "include6": "Off",
        "include7": "Toggle",
        "include8": "getEtat",
        "include9": "getManufacturerName",
        "include10": "getModelIdentifier",
        "include13 2": "Group-Membership"
      }
    }
  }

* "nameJeedom"
* "manufacturer"

    Nom du fabricant.
    Exemple: "Sonoff"
* "model"

    Modèle ou référence exacte du fabricant.
    Exemple: "BASICZBR3"
* "timeout"

  Note: Ce paramètre permet d'initialiser le champ "timeout" de la table Jeedom "eqLogic".

* "Comment"
* "comment"

    Permet d'ajouter un commentaire pour cet équipement.
* "Categorie":{"automatism":"1"}

  Liste les categories (plusieurs possibles) correspondant à l'équipement.
  Note: Ce paramètre permet d'initialiser le champ "category" de la table Jeedom "eqLogic".

  - light
  - heating
  - security
  - energy
  - automatism
  - multimedia
  - default
* "configuration"

  Note: Ce paramètre permet d'initialiser le champ "configuration" de la table Jeedom "eqLogic".

  - "uniqId"
  - "icone"

    Nom de l'icone associé.
  - "mainEP"
  - "paramBatterie"
  - "paramType"
* "Commandes":{"include1":"cmde1", "include2":"cmd2", ... "includeX":"cmdX"}

  Liste des commandes supportées. Chaque include correspond à une commande de base existante dans 'config/devices/templates'
  - "include1":"cmd1"
  - ...
  - "includeX":"cmdX"

Format de commande (JSON)
-------------------------

Exemple

  {
    "BindShortToZigateBatterie": {
      "isVisible": 0,
      "name": "BindShortToZigateBatterie",
      "order": 13,
      "isHistorized": "0",
      "Type": "action",
      "subType": "other",
      "invertBinary": "0",
      "template": "",
      "configuration": {
        "uniqId": "5c07c76621802",
        "topic": "bindShort",
        "request": "targetExtendedAddress=#addrIEEE#&targetEndpoint=#EP#&ClusterId=0001&reportToAddress=#ZiGateIEEE#",
        "visibilityCategory": "Network",
        "execAtCreation": "Yes",
        "execAtCreationDelay": "9"
      },
      "display": {
        "forceReturnLineAfter": "1"
      }
    }
  }

Variables de personalisation
----------------------------

De manière à pouvoir utiliser des commandes génériques, un certain nombre de variables permettent de personaliser la commande lors de son utilisation par l'équipement.

 - #addrIEEE#: Adresse IEEE de l'équipement
 - #ZiGateIEEE#: Adresse IEEE de la zigate
 - #EP#: End Point

Nouveau format d'équipement (JSON)
----------------------------------

EN COURS DE FINALISATION !!

Par rapport au format original, en dehors de la normalisation des clefs (anglais, minuscule puis majuscule), les changements sont les suivants:
- Ajout des champs "manufacturer" et "model" pour définir le fabricant et la ref commerciale
- Suppression de la section "configuration". Tout passe au premier niveau
- Suppression de "uniqid"
- "Categorie" => "category"
- "Commandes" => "commands" + nouvelle structure
- "battery_type" => "batteryType"
- Ajout de "batteryVolt"
- "icone" => "icon"

Le format de la section "commands" est le suivant

- "batteryType" permet de décrire le type de batterie et de preciser qu'il s'agit d'un equipement sur batterie
- "batteryVolt" permet de definir la tension max de la batterie (pour calcul pourcentage quand la remontée % n'est pas dispo)
- "commands" permet de lister toutes les commandes associées à l'equipement

    "commands": {
        "<premiere cmde Jeedom>": { "use": "<cmde de base>", "ep": <ep> },
        "<deuxieme cmde Jeedom>": { "use": "<cmde de base>", "ep": <ep> },
        ...
        "<derniere cmde Jeedom>": { "use": "<cmde de base>", "ep": <ep>, "execAtCreation": "yes" },
    }

Notes pour les commandes
- Les commande de base sont celles définies dans "core/config/commands"
- "ep" permet de préciser le EP (End Point). Il n'est obligatoire que si different de 1.
- "execAtCreation" permet de préciser que cette commande doit etre executée pendant l'inclusion pour configurer l'equipement.
  Par défaut la commande n'est pas exécutée.

Exemple:

  {
    "BASICZBR3": {
      "name": "Sonoff BASICZBR3 smart switch",
      "manufacturer": "Sonoff",
      "model": "BASICZBR3",
      "timeout": "60",
      "category": {
        "automatism": "1"
      },
      "icon": "BASICZBR3",
      "batteryType": "1x3V CR2032",
      "batteryVolt": "3",
      "commands": {
        "manufacturer": { "use": "societe" },
        "modelIdentifier": { "use": "nom" },
        "getEtatEp05": { "use": "etat", "ep": 5 },
        "bindHumidity": { "use": "BindToZigateHumidity", "ep": 2, "execAtCreation": "yes" },
        "setReportHumidity": { "use": "setReportHumidity", "ep": 2, "execAtCreation": "yes" }
      }
    }
  }
