Le processus d'inclusion
------------------------

La phase d'inclusion d'un nouvel équipement est très importante. Pendant cette phase Abeille va

- tenter d'identifier le periphérique
- le configurer si nécessaire (bind + config report)
- puis le déclarer dans Jeedom avec un ensemble de commandes qu'il supporte

Cette phase est résumée dans le diagramme suivant:

.. image:: images/inclusion_process.png


Phase d'identification
~~~~~~~~~~~~~~~~~~~~~~

La Zigate est mise en mode inclusion, prête à accepter tout équipement qui se signalera.

- EQ->Abeille: Un EQ se signale (device announce)
    C'est ici que l'adresse IEEE et l'adresse courte correspondante sont extraites.
- Abeille->EQ: Abeille demande la liste des "End Points"
- Abeille->EQ: Abeille demande le nom du modèle & fabricant (attributs "ModelIdentifier" & "Manufacturer") sur le premier EP
    Accessoirement l'attribut "location" est aussi demandé. Il peut être utile si "ModelIdentifier" n'est pas supporté.
- Si attribut "ModelIdentifier" supporté
    Nom JSON extrait de "ModelIdentifier" (suppression des caractéres spéciaux et espaces).
    Les modules "DIY" doivent normalement rentrer dans cette categorie. Bonc bien penser à renseigner leur "ModelIdentifier" dans leur firmware.
- Si l'attribut "ModelIdentifier" n'est pas supporté
    A ce jour peu de cas rencontrés;
      - Un module DIY de Texas Instrument => Bug firmware (ModelIdentifier non renseigné).
      - Les volets Profalux => identifiés par leur attribut "Location".
- Si le modèle JSON est connu (fichier JSON trouvé dans core/config/devices) pas d'autre interrogation nécessaire.
    Tout est supposé être décrit dans le fichier de config JSON.
    Passage à la configuration du device (si besoin).
- Si le modèle JSON est inconnu:
    - Pour chaque EP, demande la liste des clusters supportés
      Ces infos ne sont actuellement pas utilisées par Abeille mais stockées dans 'AbeilleDiscover.log' pour pouvoir créer manuellement le modèle JSON.

Identification spéciale Xiaomi
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Les capteurs Xiaomi V1 ne répondent pas à la requète "Active End points". La phase d'identification standard ne peut fonctionner dans ces conditions.

Pour Xiaomi, la phase est modifiée comme suit:

- Pas d'interrogation de la liste des "end points"
- Demande "modelId" sur EP01
- Identification en fonction des modèles supportés.

Phase de configuration
~~~~~~~~~~~~~~~~~~~~~~

Si l'équipement est reconnu (modèle JSON trouvé) alors il reste à exécuter les commandes marquées 'execAtCreation'.

- Il s'agit en general de 'bind' (mise-en-place d'un chemin virtuel)
- et de configuration 'reporting' (demande à l'EQ de faire un rapport tous les X sec au max)

Phase de découverte
~~~~~~~~~~~~~~~~~~~

Si l'équipement n'a pas été reconnu, on entre alors dans cette phase de découverte.
Il s'agit la de lister ce qu'il sait faire (liste des 'End Points', liste des clusters, et liste des attributs)

Actuellement cette étape consiste juste à récuperer

- Les infos de base (IEEE, manufacturer, modelId, location)
- La liste des "End Points"
- La liste des clusters supportés pour chaque EP

Le résultat de cette interrogation est disponible dans 'AbeilleDiscover.log' (accessible via la page support)
