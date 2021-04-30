La gestion des démons
---------------------

Vue d'ensemble
~~~~~~~~~~~~~~

Abeille est basé sur le fonctionnement de plusieurs démons s'executant en parallèle:
- AbeilleCmd en emission, pour envoyer les ordres vers la zigate
- AbeilleSoct en reception, pour faire le lien entre une zigate wifi et AbeilleSerialRead
- AbeilleSerialRead en reception, pour lire les message de la zigate
- AbeilleParser pour decoder les messages recus via AbeilleSerialRead

Ordre de lancement
~~~~~~~~~~~~~~~~~~

Ce point est clef.

En effet si AbeilleCmd est lancé en premier et qu'il envoie deja des ordres à la zigate avant meme que le chemin de retour ne soit fonctionnel (AbeilleSocat>AbeilleSerialRead) on risque de manquer des informations.
Ce pb à été vu par exemple dans le cas suivant
- AbeilleParser ignore les messages si l'adresse IEEE de la zigate ne correspondant pas à ce qui est attendu (possible dans le cas ou les ports different d'un boot à l'autre)
- Manque de pot AbeilleCmd avait demandé l'adresse IEEE avant que SerialRead puisse recuperer l'information.
- Du coup plus aucun message de retour n'etait accepté

Pour résoudre ce problème les démons sont lancés, puis les premiers messages sont envoyés vers AbeilleCmd.
Cela inclut le message 0009 (Get Network State) qui récupère l'adresse IEEE de la zigate.
Les premiers messages ne sont donc plus lancés par "deamon_start()" mais fait au départ du démon principal (deamon()).

Problèmes rencontrés
~~~~~~~~~~~~~~~~~~~~

Au départ le redémarrage des démons (nécessaire si crash) était déclenché par deamon_info().
Manque de pot cette fonction appelée par Jeedom est complètement asynchrone et peut même être appelée plusieurs fois par seconde.
Ca entrainait (si crash d'un démon), de multiples redémarrages concurrents du même démon.
Même si ce dernier vérifie qu'il est le seul, il s'ensuit qu'il s'arretait car voyait un autre démon identique, puis le process le relancait à nouveau. Ca finisait par "tomber en marche" mais inefficace, perte de temps, et surtout perte de données au passage.

Suite à ça, les démons sont vérifiés une fois par min via le "cron 1 min".
Si démon manquand il est relancé. Du coup 1 seule source de (re)lancement et pas de lancement concurrent.
