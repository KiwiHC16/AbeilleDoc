Langues utilisateurs et developpeurs
------------------------------------

Le plugin est initialement conçu pour la langue Française uniquement mais pour être aussi ouvert que Jeedom et permettre à la communauté internationale de l'utiliser, des règles de developpement sont nécessaires.

Proposition pour l'aspect utilisateur final

- Tout ce qui est affichable à l'utilisateur final doit pouvoir être traduit via les fichiers JSON (ex: core/i18n/en_US.json)
- Côté logs, seuls les modes info & erreur doivent apparaitrent dans la langue choisie. On ne peut en aucun cas perdre de temps sur des traductions du mode "debug".

Proposition pour les developpements

- Tout ce qui est developpement doit être en Anglais (plus compact, plus "ouvert"). Ca inclut donc

  - les noms de fonctions
  - les commentaires internes
  - les noms de répertoire
  - les noms de variables
  - les logs en mode "debug"

Propostion pour la doc

- Aucune pour l'instant. Elle n'existe qu'en Français et comme de gros changements sont en cours, ca semble prématuré.
- Contrairement au plugin, la doc n'a pas de "traduction". Un traducteur automatique donnerait surement des résultats inappropriés.
