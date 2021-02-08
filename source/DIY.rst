DIY
===

Niveau de cuve
--------------
Avant d'être dédiée au niveau de la cuve, la carte dispose de 4 entrées numériques 0 ou +5V. Donc l'usage reste ouvert à beaucoup de capteurs.
Couplée à des capteurs sans contacts, elle permet de connaitre la présence de fuel dans un tuyeau souple, type tuyau d'arrosage. Ces capteurs ont une sensibilité réglable.

Inclusion
^^^^^^^^^
L'inclusion se fait automatiquement à l'issue de la programmation du E18.
Placer le coordinateur en Inclusion, allumer ou faire un reset de la carte. Patienter qqs dizaines de secondes.
A l'issue, l'objet est créé.

Les 4 commandes principales sont : Digital Input 2 à Digital Input 5.
Chacune correspond à un type "Switch_State" binaire. Soit 0 en l'absence du 5V sur la broche et 1 en présence de +5V

Les clusters interrogés sont 

0006-02-0000
0006-03-0000
0006-04-0000
0006-05-0000 

Clusters qui correspondent à des entrées "multistate"


Fonctionnement
^^^^^^^^^^^^^^

Lorsque la carte a rejoin un réseau, la LED clignote au rythme d'une fois toutes les 5 secondes environ.

Brancher sur les entrées un quelconque capteur dont la sortie se fait en tout ou rien (0 - 5V). Pas de collecteur ouvert. Un relais peut être utilisé.
En effet, les connecteurs disposent du +5V et d'une masse en plus de l'entrée.
La consommation reste élevée (15mA). Il se peut donc que le capteur ne soit pas en mesure de maintenir le 5V.
Donc, il existe une carte interface qui s'ajoute sur la carte principale et qui nécessite très peu de courant, de l'ordre du mA.
Le fonctionnement reste identique : +5V -> Digital Input X =1 et 0 sinon.


Reset
^^^^^

Si nécessaire, pour faire le reset, il faut maintenir appuyé le bouton "Network" jusqu'à ce que la LED s'illumine faiblement et fixement.
Relâcher le bouton. La LED va clignoter rapidement puis lentement jusqu'à ce que la carte soit reliée à un réseau.

