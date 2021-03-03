Utilisation avancée
===================

Si vous souhaitez comprendre un peu + le fonctionnement d'Abeille, c'est le chapitre qu'il vous faut parcourir.

Utilisation sous Docker ou VM
-----------------------------

Ce chapitre est très spécifique et pour les utilisateurs ayant de bonnes connaissances en informatique. Je partage ici mon installation :doc:`Docker` qui me permet de s'implifier mon developpement et de faire des backup de mes Jeedom distant et difficilement accessibles.

Modèles pour nouveaux équipements
---------------------------------

Les équipements ZigBee sont representés dans Abeille par des fichiers de configuration appelés: :doc:`ModeleJson`. Ces fichiers peuvent être modifiés et d'autres peuvent être créer pour ajouter de nouveau équipements.

Cron
----

Abeille de façon régulière fait :doc:`Cron` un certain nombre de taches pour maintenir/monitorer le système.

Polling
-------

Certains équipements communiquent naturellement et échangent des messages avec la Zigate, ce qui nous permet de s'assurer qu'ils sont en vie. D'autres restent silencieux et nous devons les interroger pour savoir s'ils sont toujours dans le réseau ou simplement connaitre leur état. Abeille contient une fonction de :doc:`Polling` interrogeant régulièrement les équipements.

Configuration Bind/setReport
----------------------------

Lors de l inclusion Abeille cherche à configurer l'équipement pour que celui ci envoit ses informations à Abeille par exemple. C'est une étape délicate surtout en envirronement multi-fournisseur. Il est possible que cela ne se passe correctement. Il est possible de le refaire manuellement grace au bouton :doc:`ApplySettingToNE`. 

Radio
-----

Le ZigBee fonctionne en :doc:`Radio`. La :doc:`Radio` est sujette à divers problemes. Même si la norme Zigbee inclus plein de fonction pour nous faciliter la vie, il arrive que cela ne fonctionne pas aussi bien qu'attendu. Pour avoir une meilleur comprehension de ce qui se passe, Abeille inclus des informations, graphes representant les informations :doc:`Radio` récupérées par les équipements.

