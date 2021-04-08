Le processus d'inclusion
------------------------

La phase d'inclusion d'un nouvel équipement est la plus importante car c'est pendant cette phase qu'Abeille va

- tenter d'identifier le periph
- et déclarer l'équipement dans Jeedom avec les commandes qu'il supporte

La procédure actuelle est la suivante

- La Zigate est mise en mode inclusion, prête à accepter tout équipement qui se signalera
- EQ->Abeille: Un EQ se signale (device announce)

    C'est ici que l'adresse IEEE et l'adresse courte correspondante sont extraites.
- Abeille->EQ: Abeille demande la liste des "End Points"
- Abeille->EQ: Abeille demande le nom du modèle (attribut "ModelIdentifier") sur EP1
- Si attribut "ModelIdentifier" supporté

  Nom JSON issu de "ModelIdentifier" (suppression des caractéres spéciaux et espaces).
  Les modules "DIY" doivent normalement rentrer dans cette categorie. Bonc bien penser à renseigner leur "ModelIdentifier" dans leur firmware.
- Si l'attribut "ModelIdentifier" n'est pas supporté

  A ce jour peu de cas rencontrés;

  - Un module DIY de Texas Instrument => Bug firmware (ModelIdentifier non renseigné).
  - Les volets Profalux => identifiés par leur attribut "Location".
- Si le modèle JSON est connu (fichier JSON trouvé dans core/config/devices) pas d'autre interrogation nécessaire.

  Tout est supposé être décrit dans le fichier de config JSON.
  Passage à la configuration du device (si besoin).
- Si le modèle JSON est inconnu:

  - Demande la liste des "End Point"
  - Pour chaque EP, demande la liste des clusters supportés

    Ces infos ne sont actuellement pas utilisées par Abeille. Par contre leur trace dans les logs permet de faire le modèle JSON.

- Configuration du device.

  Essentiellement faire un "bind" ou "set report" pour avoir les retours d'état.
- Le nouvel EQ est prêt à être utilisé.
