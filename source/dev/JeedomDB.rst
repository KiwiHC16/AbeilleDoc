Format de la DB Jeedom
----------------------

Ce chapitre décrit le format de la database Jeedom appliqué au plugin "Abeille".

EN COURS DE CONSTRUCTION !!!

Commandes
~~~~~~~~~

La table "cmd" de Jeedom est formatée comme suit:

- id: ID de la commande. Affecté par Jeedom.
- eqLogic_id: ID de l'équipement auquel la commande est rattachée.
- eqType: "Abeille"
- logicalId: Nom "logique" de la commande.
  A REVOIR. Etait redondant avec le champ "topic" de "configuration".
  Example ? Regle ?
- order
- name: Un nom pour la commande.
  Quel choix entre "name" et "logicalId" ? Meme chose ?
- configuration: A priori libre d'utilisation par Abeille donc ne contient que des champs spécifiques Abeille.
  Correct ?
- template
- isHistorized: 0 ou 1
- type: "info" ou "action"
- subType: "string", "binary", "numeric", "other"
- unite
- display
- isVisible: 0 ou 1
- value
- alert
- generic_type
