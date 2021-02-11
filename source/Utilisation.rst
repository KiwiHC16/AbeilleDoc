Utilisation
===========

Inclusion
---------

La première étape pour pouvoir utiliser un équipement est de l' :doc:`Inclusion` dans le réseau zigbee géré par la zigate. Il n'existe pas de méthode universelle car chaque fabriquant est libre de procéder de la façon qu'il souhaite. Le grand principe est de mettre la zigate en mode :doc:`Inclusion` et de faire des manipulations sur l'équipement pour qu'il s' :doc:`Inclusion` et rejoigne le réseau.

Suppression
-----------

Vous avez la possibilité de faire une :doc:`Suppression` d'un équipement du réseau zigbee géré par la zigate.

Groups
------

Un fois l'équipement dans le réseau, la zigate lui attribue une adresse pour qu'il puisse dialoguer. La zigate peut lui envoyer des messages directement à cette adresse.
Maintenant si la ZiGate souhaite envoyer un même message à plusieurs équipements en même temps, elle peut utiliser une adresse de :doc:`Groups` . Cela permet d'avoir par exemple des équipements qui réagissent simultanément.

Scenes
------

Le :doc:`Groups` permet d'adresser des équipements en même temps pour une même action mais ne permet pas d'envoyer des demandes differentes. Ce point est résolu par les :doc:`Scenes`. Vous pouvez preconfigurer une ensemble d'équipments dans des configurations spécifiques est les associer à des :doc:`Scenes`. Ensuite il vous suffit de rappeler une :doc:`Scenes` pour remettre tout le monde dans la configuration désirée.

Santé
-----

Le réseau est constitué de nombreux équipements qui vivent au rythme et aléa du réseau radio, des coupures de courant, etc. Afin de monitorer le réseau Abeille propose plusieurs outils: :doc:`Health`

Tuto
----

Dans la mesure ou Abeille à pour objectif d'exploité le réseau, je vous propose quelques :doc:`Tuto` permettant de mettre en application et répondre à vos besoins.

Trucs et Astuces
----------------

D'autres fonctions de Jeedom sont bien pratiques, par exemple si vous devez :doc:`Remplacement` remplacer des équipements par d'autres, ou :doc:`Remplacement` des commandes par d'autres.

