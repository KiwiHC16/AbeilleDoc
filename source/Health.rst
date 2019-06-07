Health
======

Communication
-------------

Vue générale
^^^^^^^^^^^^

Un cron tourne *toutes les minutes* (il faut donc attendre une minute et rafraichir la page) pour vérifier la date du dernier message reçu pour chaque équipement. Pour visualiser le résultat ouvrir *Plugins->Protocoles Domotique->Abeille* et clic sur l'icône Santé. Vous devriez avoir un résultat comme:

image:Capture_d_ecran_2018_05_11_a_13_46_17.png[]

Actuellement il existe 4 statuts:

- Un carré vert avec un "-": Pas de test fait. Par exemple Abeille ne reçoit pas de message venant d'une télécommande Ikea n'ont paramétré spécifiquement, fonctionnement par défaut.
- Un carré vert avec Ok, soit l'équipement à un timeout de défini et le dernier message est arrivé dans cette période, soit il n'y en a pas et un message à été reçu dans le 24 dernières heures.
- un carré orange, l'équipement n'a pas de time out défini et le dernier message est plus vieux que 24h et moins que 7 jours (Il faut que je vérifie les timing)
- un carré rouge, soit le capteur à un time out et le dernier message est plus vieux que ce time out, soit il n'a pas de time out et le dernier message est plus que 7 jours.

Si l'équipement n'a pas de TimeOut defini ou est null alors il ne tombera pas en time out.

[[Alerte]]
=== Alerte

Alerte sur communications

Si un équipement possède un timeout défini alors des alertes peuvent être définies.

Il faut par exemple dans le fichier json d'avoir:

----
{
"Classic A60 RGBW": {
"nameJeedom": "Classic A60 RGB W",
"timeout": "60",
"Categorie": {
"automatism": "1"
},
----

Les 60 sont en minutes. Dans ce cas, l'équipement qui n'a pas eu de communications depuis plus de 60 générera des alarmes.

Pour cela il faut aussi avoir sélectionné le champ "Ajouter un message à chaque Timeout" (voir capture d'écran ci dessous).

Vous pouvez aussi ajouter une action dans le champ "Commande sur Timeout".

La vérification est faite par le core de Jeedom toutes les 5 minutes.

Le TimeOt peut être vérifié dans l'équipement:
image:Capture_d_ecran_2019_03_15_a_11_46_00.png[width=900]


=== Batterie

En utilisant le menu Analyse->Equipements, vous trouverez l'état des batteries. Ici un exemple avec des objets Zwave et Abeille/Zigbee.

image:Capture_d_ecran_2018_05_11_a_15_47_55.png[]

=== Seuil d'alerte

Menu->Roues crantées->Configuration->Equipements.

Mettez les valeurs qui vous conviennent:

image:Capture_d_ecran_2018_07_16_a_11_28_07.png[]

=== Alerte

Menu->Roues crantées->Configuration->Logs

image:Capture_d_ecran_2018_07_16_a_11_29_52.png[]

par exemple ici, une alarme est envoyée sur mon tél.


=== Script / Widget

[TIP]
Dans les premieres version d'abeille les timeout n'étaient pas implémentés alors ce script permettait d avoir des alarmes. Il n'est plus nécessaire mais je le garde car il peut servir dans des cas spécifiques avec des petites modifications.

Vous aurez un widget comme celui ci:

image:Capture_d_ecran_2018_03_27_a_10_05_02.png[]

qui vous permettra d'avoir une alarme sur le niveau de batterie et sur la remontée de message ainsi que la liste des équipements en défaut.

Pour se faire un script est en cours de dev et de test dont voici les détails.

Vous pouvez le faire tourner en manuellement en ssh ou l'intégré dans Jeedom à l'aide du plugin script (Solution présentée ci dessous).

image:Capture_d_ecran_2018_03_27_a_09_42_11.png[]

Vous créez un équipement avec une Auto-Actualisation à la fréquence que vous souhaitez, ici toutes les heures.

image:Capture_d_ecran_2018_03_27_a_09_44_59.png[]

==== Script

Le script dont vous aurez besoin est https://github.com/KiwiHC16/Abeille/blob/master/resources/AbeilleDeamon/CheckBattery.php

Faites un copy/paste dans le plugin script de Jeedom.

==== Parametres

Parametres internes au script

Lorsque vous allez éditer le script dans les étapes suivantes, vous trouverez les lignes suivanted en début de script:

----
$minBattery = 30; // Taux d'usage de la batterie pour générer une alarme.
$maxTime    = 24 * 60 * 60; // temps en seconde, temps max depuis la derniere remontée d'info de cet équipement
----

A vous de mettre, les valeurs qui conviennent à votre systeme.

Juste après vous trouverez:

----
// Liste des équipements à ignorer
$excludeEq = array(
"[Abeille][Ruche]" => 1,
"[Abeille][CheckEquipementsWithBatteries]" => 1,  // L objet du script lui-meme

);
----

C'est le tableau qui contient la liste des Equipements qu'il ne faut pas prendre en compte. Par exemple ici l'objet ruche et l'objet script (c'est à dire lui-même).

=== Batterie

TIP: Dans les premieres version d'abeille les batteries n'étaient pas implémentés alors ce script permettait d avoir des alarmes. Il n'est plus nécessaire mais je le garde car il peut servir dans des cas spécifiques avec des petites modifications.

Créez deux commandes scripts:

image:Capture_d_ecran_2018_03_27_a_10_00_01.png[]

Donnez un nom à la commande, faites Nouveau, donnez le nom du script "CheckBatteries.php", dans l'éditeur faites un paste du code, Enregistrer, ajoutez les parametres à la commande et sauvegardez.

Le premier parametre est "Batterie" car nous sommes dans le test des batteries.

Le second paramètre est "Test" pour la première commande pour avoir un retour binaire. 0: pas de Batterie en défaut, 1: au moins une Batterie sous le niveau minimum.

Le second paramètre est "List" pour la seconde commande pour avoir la liste des équipements avec un niveau de Batterie inférieure au  niveau miniCheckBatteries.phpmum.


=== Messages

Messages échangés

La même chose que pour Batterie avec pour paramètre Alive.

image:Capture_d_ecran_2018_03_27_a_10_15_40.png[]

=== Ping

TIP: Dans les premieres version d'abeille les polling n'étaient pas implémentés alors ce script permettait d avoir des alarmes. Il n'est plus nécessaire mais je le garde car il peut servir dans des cas spécifiques avec des petites modifications.

Certains équipements ne remontent pas forcement des informations de facon régulière, comme une ampoule qu'on allume une fois par semaine. Donc pour forcer l'échange de message et vérifier la présence d'un équipement, il y a une fonction "Ping".

Pour l'instant elle fonctionne pour les ampoules Ikea.

Faites un commande:

image:Capture_d_ecran_2018_03_27_a_10_18_37.png[]

En appuyant sur le bouton du widget, les équipements doivent être interrogé et repondre. Ensuite si vous faites un refresh du widget, ils ne doivent plus apparaitre dans la liste Alive s'ils y étaient.
