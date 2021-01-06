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

Structure des repertoires

- docs
  C'est le point exporté et donc visible de l'exterieur via https://kiwihc16.github.io/AbeilleDoc/
  En dehors de "products", le contenu est généré automatiquement.
  docs/products: Documentations des produits.
- docs_dev
  Documents pour developpeurs
- source
  Source des pages du user manual au format 'rst' (ReStrucTurded) à convertir avec Sphinx
  
A faire

- Virer les docs produits de source/docProduits une fois tous les liens à jour.
  Les docs produits sont maintenant dans "docs/products" et donc accessible directement.
