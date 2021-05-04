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
