Le moniteur
-----------

Ce 'moniteur' est un démon optionnel qui permet de capturer les messages envoyés vers et reçus d'un équipement particulier dans le but de suivre les échanges dans l'ordre chronologique.
Il a été conçu dans un but informatif et de debug et donc ne gère qu'un seul équipement à la fois.

Exemple sur un équipement actif::

[2021-03-25 11:06:27] >>> Démarrage du démon de monitoring
[2021-03-25 11:06:27] Adresse à surveiller: E4CA-00158D000478E64E
[2021-03-25 11:06:49] <= 8002/Data indication, Status=00, ProfId=0104, ClustId=0006, SrcEP=01, DestEP=01, SrcAddrMode=02, SrcAddr=E4CA, DestAddrMode=02, DestAddr=Ruche
[2021-03-25 11:06:49] <= 8102/Attribut report, SQN=AE, Addr=E4CA, EP=01, ClustId=0006, AttrId=0000, AttrStatus=00, AttrDataType=10, AttrSize=0001
[2021-03-25 11:06:50] <= 8002/Data indication, Status=00, ProfId=0104, ClustId=0006, SrcEP=01, DestEP=01, SrcAddrMode=02, SrcAddr=E4CA, DestAddrMode=02, DestAddr=Ruche
[2021-03-25 11:06:50] <= 8102/Attribut report, SQN=AF, Addr=E4CA, EP=01, ClustId=0006, AttrId=0000, AttrStatus=00, AttrDataType=10, AttrSize=0001
[2021-03-25 11:06:50] <= 8002/Data indication, Status=00, ProfId=0104, ClustId=0006, SrcEP=01, DestEP=01, SrcAddrMode=02, SrcAddr=E4CA, DestAddrMode=02, DestAddr=Ruche
[2021-03-25 11:06:50] <= 8102/Attribut report, SQN=B0, Addr=E4CA, EP=01, ClustId=0006, AttrId=0000, AttrStatus=00, AttrDataType=10, AttrSize=0001

Exemple sur un équipement qui ne répond pas::

[2021-03-24 18:15:52] => 0100-000e-028AB70101000000000000010005
[2021-03-24 18:15:58] <= 8011/APS data ACK, Status=A7, Addr=8AB7, EP=01, ClustId=0000
[2021-03-24 18:15:59] <= 8702/APS data confirm fail, Status=F0/MAC_ENUM_TRANSACTION_EXPIRED, SrcEP=01, DestEP=01, AddrMode=02, Addr=8AB7, SQN=4A
[2021-03-24 18:21:12] <= 8011/APS data ACK, Status=A7, Addr=8AB7, EP=00, ClustId=8006
[2021-03-24 18:30:30] => 0100-000e-028AB70101000000000000010005
[2021-03-24 18:30:36] <= 8011/APS data ACK, Status=A7, Addr=8AB7, EP=01, ClustId=0000
[2021-03-24 18:30:37] <= 8702/APS data confirm fail, Status=F0/MAC_ENUM_TRANSACTION_EXPIRED, SrcEP=01, DestEP=01, Addr

Utilisation
~~~~~~~~~~~

Le bouton "surveiller" est visible sur la page de gestion d'Abeille.

.. image:: images/MonitorHowToStart.png

Il suffit de selectionner l'équipement à surveiller et cliquer sur "surveiller" pour activer le moniteur sur cet EQ.
"AbeilleMonitor.log" devrait alors apparaitre dans l'ensemble des logs de la page de config.

.. image:: images/MonitorLog.png

Dans le détail
~~~~~~~~~~~~~~

Le moniteur utilise 3 queues de messages pour dialoguer avec AbeilleCmd & AbeilleParser:

- reçoit les messages envoyés vers l'equipement (AbeilleCmd -> AbeilleMonitor)
- reçoit les messages reçus de l'équipement (AbeilleParser -> AbeilleMonitor)
- informe AbeilleCmd que l'adresse à surveiller à changé suite à un "device announce" (AbeilleMonitor -> AbeilleCmd)

.. image:: images/MonitorTopView.png

Points manquants
~~~~~~~~~~~~~~~~

- Pas de possibilité de désactiver le moniteur


