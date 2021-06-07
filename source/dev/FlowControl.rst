Controle de flux avec la zigate
-------------------------------

A CLARIFER !!

Qq notes

alors la Zigate DIN a un control de flux de la liaison sére USB, la V2 également.
Après sur l'envoie des cmmandes c'est surtout sur le protocol. En gros
Envoie d'une commande
Attente de recevoir le 0x8000
En fonction de la commande et si il y a un ACK attendu
on attend 0x8012 ( qui indique que le message est parti de la ZIgate )
on attend 0x8011 ( le ACK)
Ou reception d'un 8702 ( NACK)
Ensuite on peut envoyer la commande suivante
