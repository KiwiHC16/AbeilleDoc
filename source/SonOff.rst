######
SonOff
######

SonOff SNZB-01: Interrupteur
----------------------------

https://github.com/KiwiHC16/Abeille/issues/1322

Fonctionenment
^^^^^^^^^^^^^^

Appui court: Toggle (Valeur 2)

Double clic: On (Valeur 1)

Clic long (4s): Off (Valeur 0)

Valeur dans la commande Click-Middle si inter bind sur la zigate.

Inclusion
^^^^^^^^^

- mettre la zigate en Inclusion
- Avec trombone, 10s sur inter au dos

Exclusion
^^^^^^^^^

- La zigate ne doit pas être en mode Inclusion
- Avec trombone, 10s sur inter au dos

Reveil
^^^^^^

- Si le module n'a jamais été configuré, il faut faire une inclusion car il reste reveillé quelques secondes après inclusion.
- Si le module est déjà configuré alors  un appui sur le bouton le reveille (J ai eu un cas ou il ne faisait pas de Data Request alors on ne peut pas lui parler, j ai du le re-inclure).

Configurer
^^^^^^^^^^

- Faire un bind vers l'équipement à piloter. Il fait ensuite On/Off/Toggle sur l'adresse de l'équipement.


SonOff SNZB-02: Temperature / Humidité
--------------------------------------

https://github.com/KiwiHC16/Abeille/issues/1323

Fonctionenment
^^^^^^^^^^^^^^

Inclusion
^^^^^^^^^

- Zigate en inclusion
- Appui long >10s sur bouton lateral

Exclusion
^^^^^^^^^

- Zigate pas en mode inclusion
- Appui long >10s sur bouton lateral

Reveil
^^^^^^

- Je ne parviens pas à le réveiller à l'aide du bouton lateral.
- Si pas configuré, l'inclure et le configurer immédiatement
- Une fois configuré, faire changer la temperature ou humidité (le mettre dans ses mains) et il doit se reveiller.

Configurer
^^^^^^^^^^

- bind/setreport sur temperature et humidite
- bind sur Power


SonOff SNZB-03: Capteur IR
--------------------------

https://github.com/KiwiHC16/Abeille/issues/1324

Fonctionenment
^^^^^^^^^^^^^^

Inclusion
^^^^^^^^^

Exclusion
^^^^^^^^^

Reveil
^^^^^^

Configurer
^^^^^^^^^^


SonOff SNZB-04: Capteur de porte
--------------------------------

https://github.com/KiwiHC16/Abeille/issues/1325

Fonctionenment
^^^^^^^^^^^^^^

Inclusion
^^^^^^^^^

Exclusion
^^^^^^^^^

Reveil
^^^^^^

Configurer
^^^^^^^^^^
