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

Un assistant de découverte Zigbee est disponible pour collecter un maximum d'informations sur l'équipement à supporter.

.. Note:: Le but du jeu est d'essayer d'avoir une réponse (bouton au VERT) pour chacune des lignes. Si un bouton reste ORANGE c'est que l'information associée est manquante. Auquel cas cliquer dessus jusqu'à avoir la réponse.

Cet assistant est accessible en

- cliquant sur l'équipement
- onglet 'Avancé'
- puis 'Assistant de découverte' et 'Ouvrir'

.. image:: images/Assistant-zigbee-1.png

.. ATTENTION:: Pour les équipements sur batterie ces interrogations sont plus compliquées car il faut reveiller d'une manière ou d'une autre l'équipement. Les équipements sur batterie ne sont en effet pas en mode "écoute" en permanence justement pour augmenter leur autonomie.

NOTE: Il se peut que malgré tout un équipement ne renvoi pas d'info, par exemple la liste des attributs pour un cluster XXXX. Ca arrive. Tous les équipements ne respectent pas forcement toutes les regles Zigbee. Dans ce cas il faudra proceder autrement ... A COMPLETER.

Une fois cette interrogation terminée,

- Télécharger le fichier "discovery.json" via le bouton "Télécharger" en bas de la page
- Créer un sujet spécifique (si il n'existe pas déja) du type "Ajout support MARQUE MODELE": https://github.com/KiwiHC16/Abeille/issues
- Et fournir le fichier "discovery.json" zippé en '.zip' puis drag & drop
