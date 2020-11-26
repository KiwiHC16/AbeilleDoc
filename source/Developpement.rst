#############
Developpement
#############

**************
Grandes lignes
**************

* branche master : pour tous les développements en cours a condition que les pushs soient utilisables et "stabilisés" pour la phase de test.
* branche beta: pour figer un développement et le mettre en test avant de passer en stable
* branche stable: version stable
* Dev en cours: autre branche

Vue générale
============

Vue générale de la solution

.. image:: images/Capture_d_ecran_2020-04-09_a_10_31_23.png

Règles à suivre
===============

* La structure des plugins est présentée dans la doc Jeedom: https://doc.jeedom.com/fr_FR/dev/plugin_template
* Si les informations ne sont pas disponibles nous prenons le plugin openzwave comme modèle: https://github.com/jeedom/plugin-openzwave
* A noter: Un template est fourni par Jeedom: https://github.com/jeedom/plugin-template mais nous ne le prenons pas en compte.

Il faut que l'on se cale le plus possible sur ces documents.

Règles à suivre additionnelles pour Abeille
===========================================

* Outils de dev: Visual Studio Code avec les paramètres par défaut.
* Git: garder le master toujours fonctionnel après un commit.
* Git: beaucoup de petit commit et souvent mais pas de gros commit pas souvent.
* Abeille / Core OS: Garder Abeille le plus loin possible de l'OS. Uniquement quand cela n'est pas possible faire du code spécifique.
* Abeille doit tourner sur une VM
* Abeille doit tourner sur un docker
* Abeille ne doit pas faire plus de 50Mo
* La doc n'est pas dans le github du plugin
* Pour éviter d'avoir deux personnes qui travaillent sur le meme sujet, nous utilisons les issues Github. Pour chaque dev que vous faites vous créé une issue et on vous l assigne. Une seule et unique personne assignée par issue.
* Le code est en Anglais
* Toutes les fonctions doivent avoir leur javadoc
* Est accepté: ///@TODO: blablabla dans le code

Hiérarchie (répertoires) du plugin Abeille
==========================================

En cours de révision. Points ouverts notés.
Basé sur "https://doc.jeedom.com/fr_FR/dev/plugin_template".

* core : Dossier contenant tous les fichiers de fonctionnement interne.
  Ne contient pas de fichiers gérant la partie "User Interface" donc pas d'html.

  * class : dossier contenant la classe du plugin.
    Les fichiers de class php doivent obligatoirement se finir par ".class.php".
  * php : dossier pouvant contenir des fonctions ne devant pas forcément appartenir à une classe (souvent utilisé pour permettre l’inclusion de multiples classes ou fichiers de configuration en une fois)
    Toutes les librairies Abeille PHP.
  * config : Fichiers de configuration du plugin.

    * A DETAILLER
  * ajax : dossier contenant les fichiers cibles d’appels AJAX.
    Les fichiers de type AJAX doivent se finir par ".ajax.php".
* desktop : Dossier contenant la vue “bureau” du plugin (en opposition avec la vue “mobile”).
  * js : Dossier contenant tous les fichiers de type javascript.
  * php : Dossier contenant tous les fichiers de type php qui font de l’affichage.
  * css : Si nécessaire, fichier CSS pour la vue "desktop".
  * modal : Dossier contenant le code des modals du plugin.
* mobile: fichiers gérant la UI "mobile"
* plugin_info : Contient les fichiers permettant à Jeedom de qualifier le plugin, de faire son installation et sa configuration

  * info.json : Fichier contenant les informations de base du plugin (il est obligatoire sinon Jeedom ne verra pas le plugin), il contient entre autre l’identifiant du module, la description, les instructions d’installation…​
  * install.php : Fichier contenant (si besoin) les méthodes d’installation et de désinstallation du plugin
  * configuration.php : Fichier contenant les paramètres à configurer du plugin indépendants des équipements de celui-ci (exemple pour le module Zwave l’ip du Raspberry Pi ayant la carte Razberry)
* docs :
  Pas utilisé pour ne pas dépasser la taille limite imposée par Jeedom.
  Les docs sont dans un repo séparé.
* tmp :
  Répertoire LOCAL (non versionné) contenant tous les fichiers temporaires ou générés (ex: qq logs, les données LQI...)

Points ouverts

* resources : On met quoi dedans ?

  * resources/scripts ou pourraient aller dans "core/scripts"
  * resources/fw_zigate : FW zigate.
  * resources/fw_wifi : FW specific partie fw_wifi
* une partie spécifique "démon" ??
  Au vu des recherches, ca n'a pas vraiment de sens. Aucun plugin a isolé son "démon", sauf "openzwave" qui lui meme se base sur un code exterieur. Le format du template n'est jamais utilisé par les plugin officiels.
  Les démons n'étant rien d'autre que des codes ou classes, je suggère de coller à la structure Jeedom ci dessus et mettre ces codes dans "core".
