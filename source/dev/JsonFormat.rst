Format fichier de configuration d'un équipement (JSON)
------------------------------------------------------

Les équipements supportés sont décrits dans des fichiers au format JSON, décrit ci-après.
Ces fichiers se trouvent dans "core/config/devices" ou "core/config/devices_local" pour les équipements perso/custom ou en cours de développement et non encore inclus dans Abeille.

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
        "icone": "BASICZBR3",
        "mainEP": "#EP#"
        "battery_type": "1x3V CR2032",
        "lastCommunicationTimeOut": "-1",
        "mainEP": "#EP#",
        "paramType": "telecommande",
        "paramBatterie": "true"
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

* nameJeedom: OBLIGATOIRE

    Type d'équipement. Ex: "Tuya smart socket"
* manufacturer

    Nom du fabricant.
    Exemple: "Sonoff"
* model

    Modèle ou référence exacte du fabricant.
    Exemple: "BASICZBR3"
* timeout

    Durée (en min) au dela de laquelle l'équipement est considéré comme HS si aucune nouvelle de lui.

* comment

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
* configuration

  Note: Ce paramètre permet d'initialiser le champ "configuration" de la table Jeedom "eqLogic".

  - uniqId
  - icone

    Nom de l'icone associé.
  - mainEP
  - paramType

    - telecommande
    - telecommande7groups
  - battery_type

    Description type de batterie (ex: 1x CR2430 3V)
  - paramBatterie: ??
  - lastCommunicationTimeOut: ??
  - GroupeEPx

    Ex: "GroupeEP1": "1001",

* Commandes

  "Commandes":{"include1":"cmde1", "include2":"cmd2", ... "includeX":"cmdX"}

  Liste des commandes supportées. Chaque include correspond à une commande de base existante dans 'config/commands'
  - "include1":"cmd1",
  - ...
  - "includeX":"cmdX",

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
      },
      "display": {
        "forceReturnLineAfter": "1"
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

 - #addrIEEE#: Adresse IEEE de l'équipement
 - #ZiGateIEEE#: Adresse IEEE de la zigate
 - #EP#: End Point

Nouveau format d'équipement (JSON)
----------------------------------

EN COURS DE FINALISATION !!

Note: Ce format reste compatible avec le format d'origine (legacy) des commandes.

Par rapport au format original, et en dehors de la normalisation des clefs (anglais, minuscule puis majuscule), les changements sont les suivants:

- "manufacturer": Nouveau champ pour le nom du fabricant/vendeur
- "model": Nouveau champ pour la ref commerciale
- "configuration": Section supprimée. Tout passe au premier niveau
- "uniqid": Supprimé.
- "Categorie" => "category"
- "Commandes" => "commands" + nouvelle structure
- "battery_type" => "batteryType"
- "batteryVolt": Nouvelle clef
- "icone" => "icon"

Le format de la section "commands" est le suivant

- "batteryType" permet de décrire le type de batterie et de preciser qu'il s'agit d'un equipement sur batterie
- "batteryVolt" permet de definir la tension max de la batterie (pour calcul pourcentage quand la remontée % n'est pas dispo)
- "commands" permet de lister toutes les commandes associées à l'equipement
- "isVisible": "yes"/"no"

  Permet de rendre la commande visible (cachée par défaut)
- "isHistorized": "yes"/"no"

  Permet d'historiser les valeurs de cette commande. Ne fait du sens que pour une commande "info".

    "commands": {
        "<premiere cmde Jeedom>": { "use": "<cmde de base>", "ep": <ep> },
        "<deuxieme cmde Jeedom>": { "use": "<cmde de base>", "ep": <ep>, "isVisible": "yes", "isHistorized": "yes" },
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
        "modelIdentifier": { "use": "nom", "isVisible": "yes" },
        "getEtatEp05": { "use": "etat", "ep": 5 },
        "bindHumidity": { "use": "BindToZigateHumidity", "ep": 2, "execAtCreation": "yes" },
        "setReportHumidity": { "use": "setReportHumidity", "ep": 2, "execAtCreation": "yes" }
      }
    }
  }

Normalisation des commandes de base zigbee
------------------------------------------

EN COURS DE REFLEXION/DEVELOPPEMENT !!

Les commandes de base sont les commandes internes à Abeille.
Parmi elles, il y a les commandes zigbee directement issues du standard et normalisées ci-apres:

- attribut R => zbGet-<ClustId>-<AttribName> (ex: zgGet-0000-ModelIdentifier)
- attribut value => zb-<ClustId>-<AttribName> (ex: zb-0000-ModelIdentifier)
- attribut W => zbSet-<ClustId>-<AttribName>
- command => zbCmd-<ClustId>-<CmdName> (ex: zbCmd-0003-Identify)

Nouveau format de commande (JSON)
---------------------------------

EN COURS DE REFLEXION/DEVELOPPEMENT !!

Note: l'evolution des équipements permet toujours d'utiliser les commandes "legacy" (ancien format)

Par rapport au format original, les modifications sont les suivantes:

- "isVisible": Inutilisé. Toute commande est cachée et est rendue visible par l'equipement appelant.
  ex: "cmdX": { "use": "zbGet-ModelIdentifier", "isVisible": "yes" }
- "order": inutilisé
- "isHistorized": inutilisé. Les commandes de base sont par défaut NON historisées. Dans la pratique tres peu le sont au final.
  A la charge de l'equipement appelant de l'activer si besoin, sinon libre à l'utilisateur une fois dans Jeedom.
  ex: "cmdX": { "use": "zbGet-0000-Manufacturer", "isHistorized": "yes" }
- "Type" => "type"
- "generic_type" => "genericType"
- "uniqId" => inutilisé
- "configuration" => supprimé. Elements remontés au top.
- Clef d'entrée = logicalId de la commande = nom de la commande Abeille. Dans ce cadre, "configuration":"topic" disparait.
- "configuration":"topic" => Plus nécessaire. Redondant avec 'logicalId'.
- template => ??
- "configuration":"repeatEventManagement" => ??
- "configuration":"visibilityCategory" => ??

Exemple:

    {
      "0006-0000": {
        "name": "etat",
        "type": "info",
        "subType": "binary",
        "genericType": "LIGHT_STATE_BOOL",
        "invertBinary": "0",
        "template": "light",
        "configuration": {
          "repeatEventManagement": "always",
          "visibilityCategory": "All"
        }
      }
    }
