#####
OSRAM
#####

*************
Prise Smart +
*************

Les prises Inddor et Outdoor semble identique. Dans Abeille par defaut elle seront considérées indoor. Vous pouvez changer l icone si elle est OutDoor.

Nouvelle inclusion
==================

* Mettre la Zigate en mode inclusion (Bouton Inclusion), la Led bleue de la Zigate doit clignoter...
* Appui long sur le bouton du flanc de la prise, la prise switche rapidement On/Off, lâcher le bouton, l'équipement doit se connecter et un objet doit apparaître dans Jeedom.

.. image:: images/plug01_new.png

Inclue
======

Déjà inclue préalablement

* un appui long (> 20s) sur le bouton latéral doit provoquer l'association (Zigate en mode inclusion) l'équipement doit se connecter et un objet doit apparaître dans Jeedom.

------------------------------------------------------- A clarifier

Retour d'état
=============

Afin de configurer le retour d'état il faut avoir:
- l'adresse IEEE sur l objet prise OSRAM
- et sur l'objet ruche

Si ce n'est pas le cas vous pouvez faire un "liste Equipements" sur la ruche. Si cela ne suffit pas il faut faire "menu->Plugins->Protocol domotique->Abeille->Network List->Table de noeuds->Recalcul du cache" (Soyez patient).

Ensuite utilisez de préférence "BindShortToZigateEtat" puis "setReportEtat". Maintenant un changement d'état doit remonter tout seul et mettre à jour l'icone.

.. image:: images/Capture_d_ecran_2018_06_27_a_11_24_09.png


Le retour d'état ne remonte que si l'état change. Donc si l'icone n'est pas synchro avec la prise vous pouvez avoir l'impression que cela ne fonctionne pas. Ex: la prise est Off et l'icone est on. Vous faites Off et rien ne se passe. Pour éviter cela un double Toggle doit réaligner tout le monde.


------------------------------------------------------- A clarifier

********
Ampoules
********

Ampoule E27 CLA 60 RGBW OSRAM (Classic E27 Multicolor)

Nouvelle inclusion
===================

* Mettre la Zigate en mode inclusion (Bouton Inclusion), la Led bleue de la Zigate doit clignoter...
* Brancher l'ampoule OSRAM. Elle devrait joindre le réseau immédiatement et un objet doit être créé dans Jeedom.

Déjà inclue
===========

* Ampoule allumée. Éteindre/Allumer 5 fois toutes les 3 s et elle doit essayer de joindre le réseau et faire un flash.


https://www.youtube.com/watch?v=PaA0DV5BXH0

*******
Routage
*******

Le routage avec les prise OSRAM ne semble pas compatible avec les autres produits comme xiaomi, ikea,... voir plus de détail dans le chapitre route et les aspects :ref:`OSRAM <radio-routes>`.
