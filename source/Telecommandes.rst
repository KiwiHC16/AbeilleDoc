Support des télécommandes
-------------------------

Les télécommandes nécessitent un chapitre à elles seules tant elles peuvent avoir un comportement différent. Cela inclut tout type d'équipement pouvant envoyer un ordre (une commande Zigbee).

- Télécommandes diverses zigbee
- Interrupteurs zigbee

Liens de communication
~~~~~~~~~~~~~~~~~~~~~~

3 cas de figures suivants sont possibles mais sont exclusifs. Certaines télécommandes supportent plusieurs de ces modes et d'autres sont conçues pour un seul et unique mode de fonctionnement.

- La télécommande envoi l'ordre vers Jeedom.

    Dans ce cas, charge à Jeedom via par exemple un scénario de faire qqch avec l'information remontée. Aucun périphérique ne reçoit l'info directement.
- La télécommande envoi l'ordre vers un groupe zigbee.

    Le groupe reçoit directement la commande SANS passer par Jeedom. Ce dernier n'est d'ailleurs pas au courant de ce qui est envoyé de la télécommande vers le groupe.
    Ce mode de fonctionnement est celui dans la télécommande Ikea "on/off switch".
- La télécommande envoi l'ordre vers un périphérique zigbee.

    Enfin la commande est envoyée vers un périphérique précis (et non pas un groupe) et la encore SANS passer par Jeedom. Auquel cas seul cet équipement reçoit la commande. Jeedom n'est au courant de rien sauf si cet équipement reporte lui meme une info vers Jeedom.
    Ex: La télécommande controle une prise et cette derniere renvoi son état vers Jeedom.

Ca se complique...
~~~~~~~~~~~~~~~~~~

Ca n'est pas tout de pouvoir choisir le "tuyau" de communication (telec vers zigate, telec vers groupe, ou telec vers périph), il faudrait aussi pouvoir choisir quel ordre envoyer. Et la cette partie n'étant pas configurable, c'est mort.

En d'autres termes, suivant les ordres envoyés par la télécommande (figés par leur firmware), on ne peut pas forcement la coupler directement avec un groupe ou un périph autre que celui pour lequel elle a été conçue.

Exemples:

- La commande la plus commune et utile est "On" ou "Off" (cluster 0006). Une télécommande qui envoie ces ordres peut aisement controler une prise, lumière, ou volet.
- Une commande du type "niveau" (cluster 0008) pourrait certes commander des volets ou un dimmer mais pas une prise standard.
- Une commande du type "couleur" (cluster 0300) n'est dédié qu'au controle de lumère.

Tout ça pour dire que même si la liaison (tuyau) voulue est possible, la commande générée n'est pas forcement compatible avec l'équipement.