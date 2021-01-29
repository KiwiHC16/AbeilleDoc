######
Scènes
######

*****
Intro
*****

Les scènes permettent d'envoyer un seul message Zigbee et d'avoir multiple équipement qui se mette en position automatiquement.

Une scène peut être: "Séance TV", qui allumera la TV, fermera les volets et mettra une lumière tamisée en place.

Pour ce faire chaque équipement doit savoir ce qu'il doit faire lorsqu'il reçoit la commande. Il doit donc avoir été paramétré avant.

Tout le parametrage se fait depuis la page menu->plugins->Protocole Domotique->Abeille.

Note: in scene est rattachée à un groupe. Vous pouvez avoir plusieurs scenes dans un meme groupe. Vous ne pouvez pas avoir de scene sans groupe.

Note: il faut Firmware 3.1D minimum et Abeille > mi février 2021.

*****
Video
*****

`Scene et telecommande.  <https://youtu.be/SKYQxPAb9W0>`_

`Gestion des scenes sur une ampoule IKEA.  <https://youtu.be/yzhu3Hu_ibs>`_


*****
Ajout
*****

Ajout d une scène à un équipement

* Preparation
  - identifiez tous les équipements qui doivent participer à une scene
  - positionnez les comme voulu (Eteint/Allumé, Couleur, Intensité,...)
* Créer un groupe.
  - selectionner les equipements souhaités (tic au dessus des icones)
  - indiquez dans le chmap "Id" un numero de champ (Hex: 4 digits)
  - Envoyez le groupe aux equipements avec le bouton "Add Group"
* Créer une scene
  - selectionner les equipements souhaités (tic au dessus des icones)
  - indiquez dans le champ "Group Id" un numero de groupe (Hex: 4 digits)
  - indiquez dans le champ "Scene Id" un numero de scene (Hex: 2 digits)
  - Demandez aux equipements d enregistrer la scene avec le bouton "Store Scene"

*******
Activer
*******

* Faites l ajout de deux scenes par exemple Group 1234 avec scene 01 et 02. cf chapitre precedent.
* Depuis cette meme page:
  - indiquez dans le champ "Group Id" un numero de groupe (Hex: 4 digits)
  - indiquez dans le champ "Scene Id" un numero de scene (Hex: 2 digits)
  - Demandez aux équipements d activer la scene avec le bouton "scene group recall"
  - Attention: ne fonctionne que sur Zigate1 pour l instant.
  - Vous pouvez le faire aussi juste pour un équipement avec la commande "Recall Scene" en l ayant selectionné auparavent.
* Depuis télécommande
  - pas encore implementé

*******
Retrait
*******

Retrait d une scène à un équipement

* en cours ...

*********
Récupérer
*********

Récupérer les scènes d'un équipement

* en cours ...

**************************************
Etat (info pour dev: json dans config)
**************************************

* sceneRemainingCapacity = Max Scene - 1 Scene Utilisées, soit nombre de scene additinelle que l on peut creer
* sceneCount = Nombre de scene en memoire
* groupId
* sceneId = Identifiant des scene pour ce groupe

*********
Remarques
*********

* "Get Scene Membership" interroge l équipement pour avoir les scenes associées à un groupe. Le resultat est enregistre en json dans la conf de l eqLogic. Par example: "sceneJson":"{\"SceneMembership\":{\"sceneRemainingCapacity\":\"05\",\"sceneCount\":\"03\",\"1111\":{\"sceneId\":\"-11-AA-22\"}}}"
* "View Scene" interroge l équipement pour avoir les détails d une scene mais Abeille ne peut traiter la réponse incomplète. La modification est en cours de dev cote firmware zigate et ne fonctionnent pas a ce stade. Par contre en attendant vous pouvez voir passer la réponse dans le log AbeilleParser message "Scene View"
