Ajout d'un nouvel équipement
============================

Cette étape consiste à créer le fichier de configuration au format JSON pour l'ajouter à ceux déja supportés et disponibles dans "core/config/devices".

Rapidement, un tel fichier va contenir

- des infos d'identification
- sa description
- le nom de l'icone à associer
- et une liste de commandes Jeedom à créer lors de l'inclusion dont celles à exécuter lors de l'inclusion pour la configuration de l'équipement

Pour plus de détails sur le contenu d'un tel fichier voir "LISEZMOI.txt" dans "core/config/devices".

Assistant de découverte zigbee
------------------------------

L'assistant de découverte est accessible en
- cliquant sur l'équipement
- onglet "avancé"
- puis "Assistant de découverte: Ouvrir"

Cet assistant est en version beta mais permet néanmoins d'interroger l'équipement pour collecter un maximum d'informations sur les services qu'il propose.

Le but du jeu est d'essayer d'avoir une réponse pour chacune des lignes. Celui ci passera en VERT si une réponse a été reçue, sinon restera en ORANGE.
Si cela n'est pas fait automatiquement alors forcer l'interrogation via le bouton de raffraichissement associé, en commencant par "End points".

.. image:: images/Assistant-zigbee-1.png

ATTENTION: Pour les équipements sur batterie ces interrogations sont plus compliquées car il faut reveiller d'une manière ou d'une autre l'équipement. Les équipements sur batterie ne sont en effet pas en mode "écoute" en permanence justement pour augmenter leur autonomie.

NOTE: Il se peut que malgré tout un équipement ne renvoi pas d'info, par exemple la liste des attributs pour un cluster XXXX. Ca arrive. Tous les équipements ne respectent pas forcement toutes les regles Zigbee. Dans ce cas il faudra proceder autrement ... A COMPLETER.

Une fois cette interrogation terminée,

- créer un sujet spécifique (si il n'existe pas déja) du type "Ajout support MARQUE MODEL": https://github.com/KiwiHC16/Abeille/issues
- et fournir le fichier "discovery.json" zippé en '.zip' puis drag & drop
