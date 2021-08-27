Ajout d'un nouvel équipement
============================

Cette étape consiste à créer le fichier de configuration au format JSON pour l'ajouter à ceux déja supportés et disponibles dans "core/config/devices".

Rapidement, un tel fichier va contenir

- des infos d'identification
- sa description
- le nom de l'icone à associer
- et une liste de commandes Jeedom à créer lors de l'inclusion

Pour plus de détails sur le contenu d'un tel fichier voir "LISZEMOI.txt" dans "core/config/devices".

Assistant de découverte zigbee
------------------------------

Cet assistant est en version beta mais permet néanmoins d'interroger l'équipement pour collecter un maximum d'informations sur les services qu'il propose.

.. image:: images/Assistant-zigbee-1.png

Le but du jeu est d'essayer de remplir chacune des lignes. Si cela n'est pas fait automatiquement alors forcer l'interrogation via le bouton de raffraichissement associé, en commencant par "End points".

ATTENTION: Pour les équipements sur batterie ces interrogations sont plus compliquées car il faut reveiller d'une manière ou d'une autre l'équipement à chaque requète. Les équipements sur batterie ne sont en effet pas en mode "écoute" en permanence justement pour augmenter leur autonomie.

NOTE: Il se peut que malgré tout un équipement ne renvoi pas d'info, par exemple la liste des attributs pour un cluster XXXX. Ca arrive. Tous les équipements ne respectent pas forcement toutes les regles Zigbee. Dans ce cas il faudra proceder autrement ... A COMPLETER.

Une fois cette interrogation terminée,

- créer un sujet spécifique (si il n'existe pas déja) du type "Ajout support MARQUE MODEL": https://github.com/KiwiHC16/Abeille/issues
- et fournir le fichier "discovery.json" zippé (drag & drop)
