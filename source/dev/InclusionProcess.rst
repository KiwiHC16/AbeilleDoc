Le processus d'inclusion
------------------------

CHAPITRE EN COURS DE CONSTRUCTION !!

La phase d'inclusion d'un nouvel équipement est la plus importante car c'est pendant cette phase qu'Abeille va

- tenter d'identifier le periph
- et déclarer l'équipement dans Jeedom avec les commandes qu'il supporte

La procédure est la suivante

- La Zigate est mise en mode inclusion, prête à accepter tout équipement qui se signalera
- Un EQ se signale (device announce)

    C'est ici que l'adresse IEEE et l'adresse courte correspondante sont extraites.
- Abeille demande le nom du modèle (attribut "ModelIdentifier")
- Si l'attribut n'est pas supporté..
  ??? Comment procède t'on ???
- Si le modèle est connu (fichier JSON trouvé dans core/config/devices) pas d'autre interrogation nécessaire.
  Tout est supposé être décrit dans le fichier de config JSON.
  Passage à la configuration du device (si besoin).
- Si le modèle est inconnu:
  - Demande la liste des "End Point"
  - Pour chaque EP, demande la liste des clusters supportés
  - ??? On fait quoi de ces infos ??? Aujourd'hui utilisation d'une "config par defaut".

- Configuration du device.
  ??? En quoi ca consiste ???
- Le nouvel EQ est prêt à être utilisé.
