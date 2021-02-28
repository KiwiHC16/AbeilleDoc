Langues utilisateurs et developpeurs
------------------------------------

Le plugin est initialement conçu pour la langue Française uniquement mais pour être aussi ouvert que Jeedom et permettre à la communauté internationale de l'utiliser, des règles de developpement sont nécessaires.

Multi-langues et utilisateur final

- Tout ce qui est affichable à l'utilisateur final doit pouvoir être traduit via les fichiers de traduction JSON (ex: core/i18n/en_US.json)
- Néanmoins côté logs, seuls les modes **info** & **erreur** doivent apparaitrent dans la langue choisie. On ne peut en aucun cas perdre de temps sur des traductions du mode "debug".

Multi-langues et developpeurs

- Tout ce qui est developpement doit être en Anglais (plus compact, plus "ouvert"). Ca inclut donc

  - les noms de fonctions
  - les commentaires internes
  - les noms de répertoire
  - les noms de variables
  - les logs en mode "debug"

Propostion pour la doc

- Aucune pour l'instant. Elle n'existe qu'en Français et comme de gros changements sont en cours, ca semble prématuré.
- Contrairement au plugin, la doc n'a pas de "traduction". Un traducteur automatique donnerait surement des résultats inappropriés.
- Autre solution qui ferait plus de sens pour répondre au plus grand nombre: écrire la doc d'abord en Anglais, et eventuellement creer une version Française quand on trouve du temps.
