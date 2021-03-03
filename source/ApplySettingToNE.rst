Configuration équipement
========================

Afin qu'un équipement remonte à Abeille des informations il est souvent nécessaire de le configurer.

Certains comme chez Xiaomi sont configurés par défaut et de ce fait rien n'est nécessaire.

Pour d'autres, Abeille doit les configurer. Cela est fait au moment de l'inclusion si tout se passe bien.

Dans le cas contraire vous pouvez le faire manuellement.

Pour les équipements sur piles, n'oubliez pas qu'il faut qu'ils soient réveillés soit par vous, soit parce qu'ils le font par eux même.

Pour la suite de ce document je vais prendre l'exemple de la tête de radiateur spirit de chez Eurotronique.

Pour cette tête, nous allons lui demander de remonter son niveau de batterie ainsi que la température.

Pour ce faire il est nécessaire de faire deux actions la première est à 'Bind' et la seconde est un 'setReport'.

Pour l'utilisateur c'est transparent, il suffit de sélectionner l'équipement dans abeilles et d'appuyer sur le bouton 'Configuration Equipement' (Apply Settings To NE).

Comme cette tête se réveille toutes les 7 secondes, il ne sera pas nécessaire à l'utilisateur d'aller la réveiller.

Elle va recevoir les informations directement depuis abeilles.

Il est possible de vérifier que les commandes ont bien été générées en regardant le Log Abeille (ce qui suppose que le plug-in est en mode debug).

Vous devriez y trouver quelque chose de similaire à la capture suivante:


[2021-03-03 11:42:10][DEBUG] : deviceId: 1808
[2021-03-03 11:42:10][DEBUG] : NE: Rad - dest: Abeille5 - address: 1EA8
[2021-03-03 11:42:10][DEBUG] : Cmd: BindShortToZigateBatterie
[2021-03-03 11:42:10][DEBUG] :      execute Cmd: BindShortToZigateBatterie
[2021-03-03 11:42:10][DEBUG] : Cmd: setReportBatterie
[2021-03-03 11:42:10][DEBUG] :      execute Cmd: setReportBatterie
[2021-03-03 11:42:10][DEBUG] : Cmd: setReportTemperature
[2021-03-03 11:42:10][DEBUG] :      execute Cmd: setReportTemperature
[2021-03-03 11:42:10][DEBUG] : Cmd: Temperature Bind
[2021-03-03 11:42:10][DEBUG] :      execute Cmd: Temperature Bind


Il peut être nécessaire de faire l action à plusieurs reprisent pour être sure que la configuration est en place.
