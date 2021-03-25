Travailler avec GitHub
----------------------

Ce chapitre décrit rapidement comment mettre en place et configurer son environnement pour pouvoir livrer des mises à jour du plugin Abeille. La même procédure peut etre appliquée pour livrer une mise à jour de la doc vers AbeilleDoc.

Il est supposé que vous ayiez quelque connaissances de l'utilisation de Git même si plusieurs rappels en sont faits.

Vue d'ensemble
~~~~~~~~~~~~~~

Le croquis suivant résume la procédure suggerée par ce chapitre.

TODO

Mise en place de l'environnement
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La mise en place décrite ci après n'est nécessaire qu'une seule fois.
Chaque nom d'utilisateur marqué en gras (**tcharp38**) doit être remplacé par votre nom d'utilisateur.

Faire un "fork" du repo d'origine via GitHub

  KiwiHC16/Abeille => **tcharp38**/Abeille

  A ce stade, il y a donc maintenant le repo d'origine et votre "fork" mais tous deux sont sous GitHub.

Cloner

  git clone https://github.com/KiwiHC16/Abeille.git Abeille.git

Configuration
  Mise à jour des infos utilisateur (nom & email)

    git config --local core.name **Tcharp38**
    git config --local core.email **xxxx.yyyy@zzzz**

  Ajout du repo cible (votre fork)

    git remote add **tcharp** https://github.com/**tcharp38**/Abeille.git

    Vous pouvez vérifier les repo distants via la commande "git remote -v"

Se réaligner et livrer ses mises-à-jour
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Se réaligner sur le master en réappliquant ses commits locaux

    git pull --rebase
ou
    git pull --rebase origin master

Pousser ses modifs vers son "fork"

  git push **tcharp** --force

Et enfin créer une Pull Request (PR) à partir de GitHub

  ATTENTION: Il est recommandé de bien regarder les différences données par GitHub.
  Ca permet de mieux sécuriser la livraison pour ne pas casser le master.

Astuces
~~~~~~~

Si vous souhaitez vous réaligner sur la branche d'origine en supprimant toute modification locale même "commitée", la commande suivante est très utile::

  git fetch origin  # Récupère toutes les infos du repo "origin"
  git reset --hard origin/master # Reset la branche courante

Cette procédure est utile par exemple avant de livrer une mise-à-jour vers le "fork" l'idée étant de
- Réaligner la branche courante (la remettre d'applomb)
- Faire ses modifications + git add + git commit
- Et les pousser vers le fork pour initier une PR sans conflits


