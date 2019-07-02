###
FAQ
###

**************************
Pont Hue et ZiGate/Abeille
**************************

" Savez vous si je peux mettre mon matos Hue dans le maillage du plugin Abeille, même si tout passe par le Pont Hue ?"

La ZiGate et le Pont Hue joue le même role dans le reseau zigbee: le coordinateur.
Il ne peut pas y avoir deux coordinateurs dans un réseau ZigBee. Tu ne peux pas avoir la Zigate et le pont Hue sur le même réseau.
Abeille ne fonctionne qu'avec la ZiGate.
Soit tu as ton équipement connecté avec le pont Hue et le plugin associé dans Jeedom.
Soit tu as ton équipement connecté avec la ZiGate et le plugin Abeille dans Jeedom.
L'équipement est soit sur l un ou sur l autre, pas possible d'etre sur les deux en même temps.
La magie de Jeedom te permet de tout piloter meme si tu as un equipement sur le pont hue et un autre sur zigate/abeille.

***************************
Matos Hue et ZiGate/Abeille
***************************

Pour faire simple vous pouvez faire:
Matos Hue -> Pont Hue -> Plugin Hue -> Jeedom
Matos Hue -> ZiGate -> Plugin Abeille -> Jeedom

Vous ne pouvez pas faire:
Matos Hue -> Pont Hue -> Abeille -> Jeedom
Matos ZigBee avec Pont Hue et ZiGate dans un même réseau radio zigbee.

******************************************
Le problème que je rencontre est la portée
******************************************

- les murs de ta maison sont épais et le signal ne passe pas
- les produits Osram ont des problemes de compatibilité pour le routage

**********************************
Etat / Evenement pour les scenarii
**********************************

"
MAIS (car il y a un mais) si on test la valeur d'un des informations "état.." et bien elle ne change pas
en fait les info "état.." passent difficilement de 0 à 1 et de 1 à 0.
A tel point qu'il faut de nombreux message pour chaque transition d'état..
"

Le "soucis" ne vient pas de la ZiGate ou d'Abeille mais de Jeedom. Quand des valeurs changent trop, vite comme c'est la cas ici, les scenario ne recuperent pas les bonnes valeurs.
Certains équipements (Xiaomi par exemple) envoient l'appui(On) et le relache(Off) du bouton dans un meme message alors que d'autres envoient un message lors de l appui(On) et un autre lors de la relâche(Off). Donc on ne peut pas gérer les scenario sur la valeur d etat mais sur l'événement.
