Support des télécommandes
-------------------------

Les télécommandes nécessitent un chapitre à elles seules tant elles peuvent avoir un comportement différent.

3 cas de figures suivants sont possibles mais sont exclusifs.

- La télécommande envoi l'ordre vers Jeedom.

    Dans ce cas, charge à Jeedom via par exemple un scénario de faire qqch avec l'information remontée. Aucun périphérique ne reçoit l'info directement.
- La télécommande envoi l'ordre vers un groupe zigbee.

    Le groupe reçoit directement la commande SANS passer par Jeedom. Ce dernier n'est d'ailleurs pas au courant de ce qui est envoyé de la télécommande vers le groupe.
- La télécommande envoi l'ordre vers un périphérique zigbee.

    Enfin la commande est envoyée vers un périphérique précis (et non pas un groupe) et la encore SANS passer par Jeedom. Auquel cas seul cet équipement reçoit la commande. Jeedom n'est au courant de rien sauf si cet équipement reporte lui meme une info vers Jeedom.
    Ex: La télécommande controle une prise et cette derniere renvoi son état vers Jeedom.

