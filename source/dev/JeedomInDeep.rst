Jeedom en profondeur
--------------------

Ce chapitre donne qq explications sur le fonctionnement interne de Jeedom, suite aux recherches nécessaires au developpement d'Abeille.

checkAndUpdateCmd()
~~~~~~~~~~~~~~~~~~~
public function checkAndUpdateCmd($_logicalId, $_value, $_updateTime = null) {}

- Verifie que l eq(uipement) est actif
- Verifie que la cmd existe
- Recupere la valeur de la commande actuelle
- Si nouvelle valeur differente de l ancienne genere un event() avec la nouvelle valeur.

  Ca va trigger les actions en relations avec cette commande.
- Met a jour la date de collecte
- Gere les aspects repeatEventManagement de la commande (par exemple si deja meme valeur on ne fait rien. Ou on fait sur chaque nouvel valeur quoi qu il arrive
- Et mets a jour 'lastCommunication' => date('Y-m-d H:i:s'), 'timeout' => 0

En gros affecte une valeur a une commande info et gere les actions associées.