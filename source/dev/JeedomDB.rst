Format de la DB Jeedom
----------------------

Ce chapitre décrit le format de la database Jeedom appliqué au plugin "Abeille".

CE DOCUMENT EST INCOMPLET !!!
Derniere update: 19/sep/21

Configuration (table config)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- plugin: "Abeille"
- key

    - AbeilleActiver1 .. 10: Indique si la Zigate X est activée.
    - AbeilleIEEE_Ok1 .. 10: Indique si la vérification de l'adresse IEEE est correcte pour éviter les switchs de port.
    - AbeilleIEEE1 .. 10: Adresse IEEE de la Zigate X.
    - AbeilleParentId: Objet parent par défaut utilisé lors de l'inclusion d'un nouvel équipement.
    - AbeilleSerialPort1 .. 10: port (ex: /dev/ttyS1)
    - AbeilleType1 .. 10: Type de Zigate X.
    - active
    - agressifTraitementAnnonce
    - blocageRecuperationEquipement
    - blocageTraitementAnnonce
    - DbVersion
    - deamonAutoMode
    - deamonRestartNumber
    - IpWifiZigate1 .. 10
    - lastDeamonLaunchTime
    - lastDependancyInstallTime
    - monitor: ID de l'équipement à surveiller par AbeilleMonitor.
    - preventLQIRequest: Option avancée pour empecher (si 'yes') les requètes LQI à minuit. Certains équipements rebootent suite à ça.
    - state
    - zigateNb: Nombre de zigates installé.
- value

Equipement (table eqLogic)
~~~~~~~~~~~~~~~~~~~~~~~~~~

- id:
   ID de l'équipement. Affecté par Jeedom.
- name
- generic_type
- logicalId
- object_id
- eqType_name
- configuration

  - createtime: mis-à-jour par Jeedom à la création de l'équipement.
  - updatetime: mis-à-jour par Jeedom à chaque changement de la configuration.
  - calculValueOffset: utilisé par Jeedom (cmd.class.php). Ex: "calculValueOffset":"#value#*10"
  - batterytime: mis-à-jour par Jeedom
  - battery_type: Utilisé par Jeedom. Mis à jour par Abeille à partir de "batteryType" du JSON.
  - 'ab::jsonId': Signature zigbee utilisée pour identifier le JSON correspondant (anciennement 'modeleJson').
  - 'ab::jsonLocation': Localisation du JSON (officiel=Abeille, custom/user=local)
- isVisible
- isEnable
- status

  - lastCommunication: date('Y-m-d H:i:s'), mis-à-jour par
      - cmd.class.php, event()
      - eqLogic.class.php, checkAlive()
      - eqLogic.class.php, checkAndUpdateCmd()
- timeout
- category
- display
- order
- comment
- tags

Commandes (table cmd)
~~~~~~~~~~~~~~~~~~~~~

La table "cmd" de Jeedom est formatée comme suit:

- id: int
   ID de la commande. Affecté par Jeedom.
- eqLogic_id: int
   ID de l'équipement auquel la commande est rattachée.
- eqType: varchar
   "Abeille"
- logicalId: varchar
   Nom "logique" de la commande.
   Prend actuellement la clef d'entrée de la commande mais semble inutilisé & redondant avec "topic".
   A REVOIR côté Abeille !!
- order: int
   Ordre d'apparition de la commande (si visible) dans le widget.
- name: varchar
   Nom Jeedom de la commande.
- configuration: text
   A priori libre d'utilisation par Abeille donc ne contient que des champs spécifiques Abeille.
   Correct ?
- template: text
   ??
- isHistorized: varchar
   0 ou 1
- type: varchar
   Type de commande: "info" ou "action"
- subType: varchar
   Type d'information: "string", "binary", "numeric", "other"
- unite: varchar
   Unité de l'information (si cmde info): ex '%'
- display: text
   Options d'affichage dans le widget.
- isVisible: int
   0 ou 1
- value: varchar
   ??
- alert: text
   ??
- generic_type: varchar
   ??

