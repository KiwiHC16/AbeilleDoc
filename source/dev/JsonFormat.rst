Format de fichier de configuration d'un équipement (JSON)
---------------------------------------------------------

Les équipements supportés sont décrits dans des fichiers au format JSON, discuté ci-après.
Ces fichiers se trouvent dans "core/config/devices" pour les équipement supportés nativement par Abeille ou "core/config/devices_local" pour les équipements perso/custom ou en cours de développement et non encore inclus dans Abeille.

Exemple::

  {
    "BASICZBR3": {
      "type": "Sonoff BASICZBR3 smart switch",
      "manufacturer": "Sonoff",
      "model": "BASICZBR3",
      "timeout": "60",
      "category": {
        "automatism": "1"
      },
      "configuration": {
        "icon": "BASICZBR3",
        "mainEP": "02"
        "batteryType": "1x3V CR2032",
        "lastCommunicationTimeOut": "-1",
        "paramType": "telecommande",
        "paramBatterie": "true"
      },
      "commands": {
        "Groups": { "use": "Group-Membership" },

        "Status": { "use": "zb-0006-OnOff", "isVisible": 1, "nextLine": "after" },
        "On": { "use": "zbCmd-0006-On", "isVisible": 1 },
        "Off": { "use": "zbCmd-0006-Off", "isVisible": 1 },
        "Toggle": { "use": "zbCmd-0006-Toggle" },
        "Up": { "use": "zbCmdR-Custom", "params": "ep=01&clustId=0006&cmdId=01", "isVisible": 1 },
        "Down": { "use": "zbCmdR-Custom", "params": "ep=02&clustId=0006&cmdId=00", "isVisible": 1 }
      }
    }
  }

* type: OBLIGATOIRE (anciennement 'nameJeedom')

  Type d'équipement. Ex: "Tuya smart socket"
* manufacturer: OBLIGATOIRE

  Nom du fabricant.
  Exemple: "Sonoff"
* model: OBLIGATOIRE

  Modèle ou référence exacte du fabricant. Exemple: "BASICZBR3"
* timeout

  Durée (en min) au dela de laquelle l'équipement est considéré comme HS si aucune nouvelle de lui.

* comment: Optionnel

  Permet d'ajouter un commentaire pour cet équipement.
* category

  Exemple::

  "category":{"automatism":"1"}

  Liste les categories (plusieurs possibles) correspondant à l'équipement.
  Note: Ce paramètre permet d'initialiser le champ "category" de la table Jeedom "eqLogic".

  - light
  - heating
  - security
  - energy
  - automatism
  - multimedia
  - default
* configuration

  Note: Ce paramètre permet d'initialiser le champ "configuration" de la table Jeedom "eqLogic".

  - icon

    Nom de l'icone associé.
  - mainEP: OBLIGATOIRE

    Defini le "End point" à utiliser par défaut si celui-ci n'est pas explicite dans la commande.
  - paramType

    - telecommande
    - telecommande7groups
  - batteryType: OBLIGATOIRE si équipement sur batterie

    Description du type de batterie (ex: 1x3V CR2430)
  - paramBatterie: ??
  - lastCommunicationTimeOut: ??
  - GroupeEPx

    Ex: "GroupeEP1": "1001",

* commands

  Exemple::

    "commands": {
        "<premiere cmde Jeedom>": { "use": "<cmde de base>", "params": "ep=XX" },
        "<deuxieme cmde Jeedom>": { "use": "<cmde de base>", "params": "ep=XX", "isVisible": "yes", "isHistorized": "yes" },
        ...
        "<derniere cmde Jeedom>": { "use": "<cmde de base>", "params": "ep=XX", "execAtCreation": "yes" },
    }

  Notes pour les commandes

  - Les commande de base sont celles définies dans "core/config/commands"
  - "ep" permet de préciser le EP (End Point). Si il n'est pas défini, "mainEP" sera utilisé.
  - "execAtCreation" permet de préciser que cette commande doit etre executée pendant l'inclusion pour configurer l'equipement.
    Par défaut la commande n'est pas exécutée.

Format fichier de commande (JSON)
---------------------------------

Ces fichiers se trouvent dans "core/config/commands".

Exemple

  {
    "BindShortToZigateBatterie": {
      "isVisible": 0,
      "name": "BindShortToZigateBatterie",
      "isHistorized": 0,
      "Type": "action",
      "subType": "other",
      "invertBinary": "0",
      "template": "",
      "configuration": {
        "topic": "bindShort",
        "request": "targetExtendedAddress=#addrIEEE#&targetEndpoint=#EP#&ClusterId=0001&reportToAddress=#ZiGateIEEE#",
        "visibilityCategory": "Network",
        "minValue": "0",
        "maxValue": "90",
        "historizeRound": "0",
        "calculValueOffset": "",
        "execAtCreation": "Yes",
        "execAtCreationDelay": "9",
        "repeatEventManagement": "always",
        "visibiltyTemplate": "1",
        "RefreshData": "1",
      }
    }
  }

* Clef d'entrée (BindShortToZigateBatterie)

    Devient "logicalId" de la commande. Il n'est pas forcement en ligne avec le nom du fichier.

* name: OBLIGATOIRE

    Nom Jeedom de la commande

* Type & subType: OBLIGATOIRE

    Type = 'info' ou 'action'
    subType = 'numeric', 'string', 'binary', 'other'
* invertBinary: Optionnel. Utilisé par Jeedom pour inverser le résultat d'une commande info du type "binary".

    TODO: Devrait etre dans la section "display".
* order: OBSOLETE

    L'ordre d'affichage des commandes est par défaut celui de leur déclaration dans le fichier de config "équipement".
* configuration

    - topic: Nom Abeille de la commande
    - request: parametres associés à 'topic'
    - minValue:
    - maxValue:
    - historizeRound: ?
    - calculValueOffset: Indique à Jeedom d'appliquer une formule sur la valeur reçue.

        Ex: "calculValueOffset": "#value#/10",
        Ex: "calculValueOffset": "#value#/255*100"
    - repeatEventManagement: ?
    - visibiltyTemplate: ? Semble ne pas etre utilisé du tout, ni par Jeedom ni par Abeille.
    - RefreshData: ?
    - uniqId: OBSOLETE
* display: Options d'affichage optionnelles.

    * forceReturnLineAfter: Force le passage à la ligne après l'affichage du widget.

Variables de personalisation
----------------------------

De manière à pouvoir utiliser des commandes génériques, un certain nombre de variables permettent de personaliser la commande lors de son utilisation par l'équipement.

 - #addrIEEE# ou #ADDR#: Adresse IEEE de l'équipement
 - #ZiGateIEEE#: Adresse IEEE de la zigate
 - #EP#: End Point

Normalisation des commandes de base zigbee
------------------------------------------

EN COURS DE REFLEXION/DEVELOPPEMENT !!

Les commandes de base sont les commandes internes à Abeille.
Parmi elles, il y a les commandes zigbee directement issues du standard et normalisées ci-apres:

- attribut R => zbGet-<ClustId>-<AttribName> (ex: zgGet-0000-ModelIdentifier)
- attribut value => zb-<ClustId>-<AttribName> (ex: zb-0000-ModelIdentifier)
- attribut W => zbSet-<ClustId>-<AttribName>
- command => zbCmd-<ClustId>-<CmdName> (ex: zbCmd-0003-Identify)
- command reçue => zbCmdR-<ClustId>-<CmdName> (ex: zbCmd-0003-Identify)
