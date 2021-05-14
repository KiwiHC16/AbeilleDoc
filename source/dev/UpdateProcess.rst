Procédures de mise-à-jour
-------------------------

Ce chapitre n'est pas tiré d'une quelconque doc officielle Jeedom mais issu de recherches via le code Jeedom. Le but est de clarifier la procédure de mise-à-jour utilisée par Jeedom.

A partir du market
~~~~~~~~~~~~~~~~~~

A creuser

A partir de GitHub
~~~~~~~~~~~~~~~~~~

.. image:: images/UpdateFromGitHub.png

A priori Jeedom fait la chose suivante (trouvé dans 'core/class/update.class.php')

- Telechargement du zip correspondant au repo donné
- Le téléchargement se fait dans /tmp/jeedom/<nom-special> (ex: /tmp/jeedom/tcharp38-Abeille-af97a57)
- Décompression du zip au même endroit
- Déplacement de tous les répertoires vers la destination finale (...plugins/abeille)

Cette procédure semble avoir plusieurs failles qui doivent être prises en compte côté Abeille

- Pas ou tres peu de controle à chaque étape. Un pb de manque de place peut passer inapercu jusqu'au mauvais fonctionnement du plugin.
- Les droits des fichiers (en particulier des scripts ou autre binaire) semblent ignorés et pas restaurés.
