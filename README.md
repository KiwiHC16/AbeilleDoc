Documentation du plugin Abeille pour Jeedom

Mise à jour de la doc
- modifier les fichiers sources ".rst"
- regenerer la doc au format HTML (Sphinx nécessaire)
    ./gen_docs.sh (Linux/MinGW)
    ./gen_docs.bat (Windows)
- git add -u docs/*
- git commit -m "Mise à jour.. bla bla bla"
- git push
- Generer une "Push Request" à partir de GitHub

Une fois intégrée la mise-à-jour est visualisable directement via https://kiwihc16.github.io/AbeilleDoc/

A noter:
- ./gen_docs.sh (Linux/MinGW): contient des ^M a virer avec dos2unix -n gen_docs.sh gen_docs_u.sh
- ./gen_docs.sh (Linux/MinGW): chmod u+x ./gen_docs.sh
- Installation de Sphinx: https://www.sphinx-doc.org/en/master/usage/installation.html
    - apt-get install python3-sphinx

Structure des repertoires

- docs
  C'est le point exporté et donc visible de l'exterieur via https://kiwihc16.github.io/AbeilleDoc/
  En dehors de "products", le contenu est généré automatiquement.
  docs/products: Documentations des produits (ATTENTION ! pas accessible de l'exterieur autrement que via un lien "blob" puis "download"
  Ex: https://github.com/KiwiHC16/AbeilleDoc/blob/master/docs/products/SPZB0001/2020_01_14_13_52_22.pdf
- docs_dev
  Documents pour developpeurs
- source
  Source des pages du user manual au format 'rst' (ReStrucTurded) à convertir avec Sphinx
  
A faire

- "docs/products" ne semble pas accessible de l'exterieur. Possible via "blob". Pourquoi ?
- Virer les docs produits de source/docProduits une fois tous les liens à jour.
  Les docs produits sont maintenant dans "docs/products" et donc accessible directement.
