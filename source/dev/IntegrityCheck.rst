Test d'intégrité du plugin
--------------------------

Besoin
~~~~~~

Après une mise-à-jour, il est important de

- vérifier que les fichiers sont intègres
- virer les fichiers obsolètes

En effet il se peut que par manque de place le processus de mise-à-jour se passe mal et qu'aucune information en ce sens ne soit remontée à l'utilisateur.

La solution adoptée est de générer un fichier de signature MD5 pour tous les fichiers versionnés (et uniquement ceux la), juste avant le push. Le script ".tools/gen_md5.sh" est fait pour ça.

Problèmes
~~~~~~~~~
- Le fichier de signature doit être le DERNIER mis-à-jour avant le push
- Il doit contenir une information permettant de savoir si il est toujours valide

Solution actuelle
~~~~~~~~~~~~~~~~~

Le script ".tools/git_push.sh" doit être utilisé pour tout nouveau push. Il va

- modifier le fichier de version (plugin_info/Abeille.version)
- regenerer les signatures via ".tools/gen_md5.sh" dans "plugin_info/Abeille.md5"
- et faire le git add + commit + push

Autres problèmes
~~~~~~~~~~~~~~~~
Si on a une solution pour les push, il n'y en a pour l'instant aucune lors des merge, surtout si le merge est fait directement côté GitHub.

Apres n'importe quel merge, ni la version ni les signatures ne sont à jour. Il faut donc ne pas tenter le test d'intégrité en l'etat.

Attention un "git pull" fait un merge. Seul celui qui clone la branche de 0, ou qui fait un "git reset --hard" sera parfaitement aligné et pourra effectuer le test d'intégrité.

Format 'Abeille.version'
~~~~~~~~~~~~~~~~~~~~~~~~
Le format actuel est du type::

  # Auto-generated Abeille's version
  YYDDMM-BRANCH-X

La branche est celle de départ, et en aucun cas la branche de destination.

Le 'X' permet de numéroter differents push le même jour mais dans le cas d'une branche "stable" ou "beta" il est probable qu'il reste à 1 la plupart du temps.

Format 'Abeille.md5'
~~~~~~~~~~~~~~~~~~~~
Le format actuel est du type::

  # Auto-generated Abeille's MD5 file. DO NOT MODIFY !
  # VERSION="210209-DEV_TCHARP38-7"
  xxxxxxxxx-md5-skipped-xxxxxxxxxx *.editorconfig
  xxxxxxxxx-md5-skipped-xxxxxxxxxx *.gitattributes
  4ab85f363cd3a7261ffe01ec8250b0ef *Network/AbeilleLQI.php
  0e64aeaf27361deeeda734eec1acdcaf *Network/AbeilleLQI_List.php
  351f27fbeb161e7a4d7450c3b5c3548a *Network/AbeilleLQI_Map.php
