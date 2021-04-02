Le processus d'inclusion
------------------------

CHAPITRE EN COURS DE CONSTRUCTION !!

La phase d'inclusion d'un nouvel équipement est la plus importante car c'est pendant cette phase qu'Abeille va

- tenter d'identifier le periph
- et déclarer l'équipement dans Jeedom avec les commandes qu'il supporte

La procédure actuelle est la suivante

- La Zigate est mise en mode inclusion, prête à accepter tout équipement qui se signalera
- Un EQ se signale (device announce)

    C'est ici que l'adresse IEEE et l'adresse courte correspondante sont extraites.
- Abeille demande la liste des "End Points"
- Abeille demande le nom du modèle (attribut "ModelIdentifier") sur EP1
- Si attribut "ModelIdentifier" supporté

  Nom JSON issu de "ModelIdentifier".
- Si l'attribut "ModelIdentifier" n'est pas supporté

  A ce jour peu de cas rencontrés;

  - Un module DIY de Texas Instrument => identifié comment ?
  - Les volets Profalux => identifiés par leur attribut "Location".
- Si le modèle est connu (fichier JSON trouvé dans core/config/devices) pas d'autre interrogation nécessaire.
  Tout est supposé être décrit dans le fichier de config JSON.
  Passage à la configuration du device (si besoin).
- Si le modèle est inconnu:

  - Demande la liste des "End Point"
  - Pour chaque EP, demande la liste des clusters supportés
  - ??? On fait quoi de ces infos ??? Aujourd'hui utilisation d'une "config par defaut".

- Configuration du device.

  Essentiellement faire un "bind" ou "set report" pour avoir les retours d'état.
- Le nouvel EQ est prêt à être utilisé.

Nouvelle procédure (proposition en cours)

- Zigate en mode inclusion
- EQ->Abeille: Device announce
- Abeille->EQ: Demande "ModelIdentifier"
- Si "ModelIdentifier" reçu

  Nom modele JSON = ModelIdentifier
- Si "ModelIdentifier" pas supporté

  - Abeille->EQ: Demande "Location"
  ... A COMPLETER ...
- Modele JSON existe ?

  - Si existe

    - Configuration à partir des infos du fichier JSON
  - Si n'existe pas

    - Configuration à partir du fichier par défaut.
    - TODO: Interrogation liste EP + clusters + attributs pour configurer.
- EQ ready
