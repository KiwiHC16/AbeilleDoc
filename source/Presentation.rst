Introduction
============


Introduction
------------

La **Zigate** (https://Zigate.fr/) est une passerelle universelle pour le protocole Zigbee. Elle est compatible avec énormément de matériels radios Zigbee. Grâce à elle, vous offrez à votre domotique un large panel de possibilités. La Zigate est modulable, performante et ouverte pour qu'elle puisse évoluer selon vos besoins.


Le plugin **Abeille** permet d'ajouter la zigate dans un environnement Jeedom et ainsi de mettre en place un réseau Zigbee avec des produits du marché et des réalisations personnelles (DIY).

Ce plugin est né de besoins personnels : capteur de température radio distant avec un réseau sécurisé, mesh,…

Ce plugin inclus les fonctions de base pour la gestion d'équipements comme On/Off/Toggle/Up/Down/Detection/…

Il supporte aussi des fonctions avancées pour faciliter la gestion d’un gros réseau :

* Retour d'état des équipements,
* Santé (Dernière communication,…)
* Niveau des batteries
* Graphe du réseau
* Liste de tous les équipements du réseau
* Informations radio sur les liaisons entre les équipements
* En mode USB, en mode Wifi ou en mode GPIO (PiZigate)
* Fonctionne avec Homebridge

Cagnotte
--------

`Participez à la cagnotte pour acheter des équipements pour supporter le développement. <https://paypal.me/KiwiHC16>`_

.. image:: images/Cagnote.png

`Participer à la Cagnotte <https://paypal.me/KiwiHC16>`_

Le budget depuis le début est assez conséquent, surtout quand j'investis dans des équipements que je n'utiliserai pas moi même.
Alors j'ouvre une cagnotte pour financer l'achat d'équipements pour faciliter l'intégration dans Abeille.
L'idée est d'avoir au moins un exemplaire de ce que les utilisateurs d'Abeille utilisent.
Je n'ai aucune idée de votre participation à cette cagnotte mais comme tout est open source depuis le début, la :doc:`Cagnotte` est aussi complètement transparente.

Support
-------

Pour toute difficulté, deux possibilités :

* un fil de discussion sur le link:https://community.jeedom.com/tag/plugin-abeille[forum de Jeedom]
* une link:https://github.com/KiwiHC16/Abeille/issues?utf8=✓&q=is%3Aissue[« issue » dans Github]

Périphériques compatibles
-------------------------

Généralement tout matériel répondant au standard Zigbee mais la liste des équipements déja supportés est donnée dans le chapitre :doc:`devices/CompatibilityList`

Les possibilités
----------------

* inclure des équipements Zigbee depuis Jeedom
* avoir l'état d'une ampoule Zigbee, son niveau de brillance, ses caractéristiques (nom, fabriquant, SW level).
* commander les ampoules une par une (On/Off, niveau, couleur,...)
* commander les ampoules et autre par groupe (On/Off, niveau)
* avoir l'état de la prise Xiaomi avec la puissance et la consommation (Nom et Fabriquant)
* avoir les températures, humidité, pression Xiaomi, son nom, tension batterie
* avoir la remontée d'une présence (capteur infrarouge Xiaomi)
* avoir la remontée d'ouverture de porte
* avoir les clics sur les interrupteurs (1, 2, 3 ou 4 clics)
* définir des groupes comprenant des ampoules IKEA et prise xiaomi (Je peux donc avoir un mix dans le même groupe qui est commandé par une télécommande IKEA par exemple, ou faire un va et vient sur des ampoules IKEA avec 2 télécommandes IKEA (ce qui n'est pas possible avec la solution pure IKEA),...)
* définir des va et vient facilement entre des marques de télécommande et d'ampoules différentes
* profiter du réseau "mesh" Zigbee étendu multi-marque
