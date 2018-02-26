Liaisons des différents objets dans QWAT
========================================

Dans QWAT il n’y a que 2 types de liaison à créer manuellement, à savoir:

* les liaisons parents‐enfants des conduites (cela permet de lier 2 conduites adjacentes ayant les même attributs, qui seront agrégées en un seul objet dans les vues schématiques)
* Les liaisons fuites‐conduites (Afin de relier une fuite à la conduite sur laquelle elle se trouve)

Création des relations parents‐enfants des conduites
----------------------------------------------------

Pour créer une relation parent‐enfant, il faut sélectionner la catégorie « conduites »
qui est une sous‐couche dans la couche « Réseau ».
Basculer en mode édition.

.. image:: img/icon_edit.png

Sélectionner la conduite enfant (celle qui va reprendre les attributs de la conduite parent) avec le bouton « identifier les entités ».

.. image:: img/icon_identify.png

Le masque de l’objet s’ouvre.
Il faut ensuite aller dans l’onglet « Rendu ». Vous avez un champ « Parent » qui indique le numéro
de la conduite parent, si il y en a une. Pour rajouter une conduite parent, il faut cliquer sur le bouton

.. image:: img/icon_link.png

et ensuite aller cliquez sur notre conduite parent (sur le plan). Le champ parent a du se remplir.

Suppression des relations parents‐enfants des conduites
-------------------------------------------------------

Pour supprimer une relation parent‐enfant, il faut sélectionner la catégorie « conduites »
qui est une sous‐couche dans la couche « Réseau ».
Basculer en mode édition

.. image:: img/icon_edit.png

Sélectionner la conduite enfant (celle qui va reprendre les attributs de la conduite parent)
avec le bouton « identifier les entités ».

.. image:: img/icon_identify.png

Le masque de l’objet s’ouvre. Il faut ensuite aller dans l’onglet « Rendu ».
Vous avez un champ « Parent » qui indique le numéro de la conduite parent.
Pour supprimer ce numéro, cliquez sur le  bouton

.. image:: img/icon_del_relation.png

Le numéro a du s’effacer et il doit y avoir à la place « NULL (pas de sélection) ».

Création des relations fuites‐conduites
---------------------------------------

Une fois le manchon de réparation crée, il faut faire passer la conduite par ce manchon.
Pour se faire, utiliser « l’outil de nœud »

.. image:: img/icon_edge_tools.png

et double cliquer sur la conduite à un endroit proche du manchon de réparation.
Déplacer le point nouvellement créer avec le même outil. Ouvrir le masque de la conduite,
aller sous l’onglet « fuite » et créer la liaison en activant l’édition de donnée

.. image:: img/icon_edit.png

Cliquer ensuite sur:

.. image:: img/icon_create_link.png

Un tableau de toutes les fuites apparait, trouver celle qui nous concerne et sélectionner‐la
en cliquant sur le numéro de ligne correspondant. Cliquer ensuite sur « OK », vous êtes ramenés dans le
masque de la conduite avec normalement le numéro ID du manchon de réparation indiqué en rouge.

Désactiver ensuite l’éditeur de donnée, on vous demande si vous voulez sauver les modifications
de la couche « fuites ». Cliquer sur enregistrer. Le numéro doit être passé en noir.
