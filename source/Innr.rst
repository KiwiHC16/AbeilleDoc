####
Innr
####

************
Telecommande
************

Exclusion:

* Assurez vous que les zigates ne sont pas en mode inclusion.
* long appui sur Gros Bouton et Program pendant disons 10s ou plus. Va générer un Leave et reset des parametres.

Inclusion

* Mettre la zigate en mode Inclusion
* Appui sur le - et program pendant 10s ou plus. La telecommande va rejoindre le reseau et Abeille va la configurer.

Configuration standard:

* Mode Scene

Bouton - Gros + pilote tous les equipments
Bouton 1 à 6 envoie le niveau declarage à tous les equipements sur le reseau

* Mode Light

Bouton - Gros + pilote tous les equipments
Bouton 1 à 6 ne font rien

Configuration Standard Abeille:

* Mode Scene

Bouton - Gros + pilote tous les equipments du groupe 1001
Bouton 1 à 6 envoie le niveau declarage à tous les equipements du groupe 1001

* Mode Light

Bouton - Gros + pilote tous les equipments du groupe 1001
Bouton 1 à 6 pilote les groupe 3003, 4004 à 8008


Reconfigurer les groupes:

* Exclure la telecommande du reseau zigbee
* Surtout ne pas effacer l objet dans Abeille
* Definir les groupes dans les parametres dans Abeille
* Inclure la telecommande
* Appliquer la configuration en activant la telecommande (en cours de dev #1794 (https://github.com/KiwiHC16/Abeille/issues/1794).

