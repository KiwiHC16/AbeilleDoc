Danfoss
-------

********************
Ally: Tete Radiateur
********************

.. image:: images/Capture_d_ecran_2019_07_06_a_09_17_19.png


Premiere mise sous tension
~~~~~~~~~~~~~~~~~~~~~~~~~~

* Mettre la zigate en mode inclusion
* Enlever le couvercle d'Ally en tirant et en appuyant sur le clips situé en dessous
* Retirer la bande papier qui protège les piles
* Un appui court sur le bouton proche écran
* L'inclusion doit se faire et vous devez voir Ally dans la liste des équipements

Observations
~~~~~~~~~~~~

* Test fait sur canal 15.
* Répond dans les 7s à  un getName ou getEP.
* Affichage éteint par défaut.

inclusion
~~~~~~~~~

https://github.com/KiwiHC16/AbeilleDoc/blob/master/docs/products/eTRV0100/AN235786405824en-010101.pdf


Fonctions
~~~~~~~~~

Fonctionne:
 * Définition de la consigne de temperature de chauffage (Consigne)
 * Lecture de la consigne de temperature de chauffage (Consigne)
 * Lecture de la température ambiante
 * Lecture du mode en cours (D apres la norme: 00: Off, 01: Auto, 03: Cool, 04: Heat, 05: Emergency Heating, 06: Pre Cooling, 07: Fan Onl )
 * Lecture Batterie pourcentage
 * Lecture Batterie voltage
 * Lecture Mode Affichage (D apres norme: 00: Temperature en °C, 01: Temperature en °F)
 * Definition du Mode d affichage (mais la tete refuse le mode °F)
 * Lecture Key Lock (D apres norme: 00: No Lockout, 01: Level 1 Lockout, 02: Level 2, 03: Level 3, 04: Level 4, 05: Level 5 (le moins de fonctionalité pour l utilisateur))
 * Definition du niveau de Lockout (1 à 5): il n accepte que les valeurs 0 et 1. A 1 on ne peut pas modifier la temperature en tournant la molette. A 0 oui.

Pas supporté:
 *

En cours d investigation:

.. a noter:: Cependa
