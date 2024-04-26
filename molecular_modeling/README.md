# Modélisation moléculaire
## Houcemeddine Othman, 26 Avril 2024
![by-nc](https://mirrors.creativecommons.org/presskit/buttons/88x31/png/by-nc.png)
## Exploration des base des données des structures
Pour cette partie, vous allez explorer la base de données PDB. À son achèvement, vous serez capable de différencier entre les différents types de données 'structures', extraire les fichiers structures et séquences, explorer les métadonnées, exploiter les liens externes vers d'autres banques de données.

* Pointer votre navigateur sur la page (https://www.rcsb.org)[https://www.rcsb.org]
* Noter combien de structures sont déposées dans la base PDB.
*  Saisir le code PDB '1S02'. Il s'agit de quelle protéine ? 
* Quel est le code Uniprot associé à cette protéine ? 
* Quel est l'identifiant PMID de l'article original qui décrit cette structure ? 
* Laquelle des méthodes expérimentales a été utilisée pour résoudre la structure de cette protéine ? 
* Quelle est la résolution de cette structure ?
* créer un dossier 'modeling' sur votre PC.
* Télécharger la structure et la séquence de cette protéine en format PDB et FASTA respectivement dans le dossier 'modeling'.
* Ouvrir le fichier téléchargé avec un éditeur de texte (Gedit, Notepad++, nano ...). Explorer les différents blocs d'information contenue dans ce fichier. 
* Télécharger la structure avec le code '1Q2K' et noter les différences avec le fichier précédent. 

## Exploration visuelle des modèles 3D 
L'utilisation d'un visualisateur moléculaire (MV) permet d'explorer le contenu, interactivement,  interactivement à partir de l'interface graphique de votre ordinateur. L'exploration visuelle est une étape très importante pour la détection des erreurs de modélisation, la caractérisation fonctionnelle, l'identification des sites d'interaction des ligands et ds interfaces protéine-protéine. La connaissance élémentaire des principes biophysiques et chimiques contrôlant les mécanismes biomoléculaires  (interaction non covalente, classification des acides aminés ...) est un atout important pour plus de fiabilité de l'analyse visuelle.

Dans cette partie, nous utiliserons le PyMOL. D'autres programmes gratuits peuvent aussi être utilisés pour l'analyse visuelle, comme Chimera, VMD, JMV et Rastop.

* Utiliser la ligne de commande de PyMOL pour télécharger la structure 1KXQ. 
    ```
        $ fetch 1kxq
    ```
* Utiliser les métadonnées dans sur la page PDB pour collecter les informations concernant le nom de cette protéine, son code Uniprot et l'organisme auqel elle appartient.    
* Manipuler la structure de la protéine pour obtenir les différentes représentations moléculaires. 
* Grace aux options de coloration, et aux informations contenues dans la page Uniprot, quel est le niveau de l'hiérarchie du repliement de protéine?

Dans les étapes suivantes, nous essayerons de nettoyer la structure téléchargée pour pouvoir l'utiliser dans la modélisation moléculaire. 

```
    select to_remove, all and not chain X
```
Que représentes les atomes rouges qui entourent la protéine? 

```
select sele, resn HOH
remove sele
```

Enregitrer la structure de la protéine dans un dossier séparé pour à la modélisation moléculaire. 

```
save aamylase.pdb
```

En utilisant la représentation de la surface moléculaire et le bouton 'Scroll' de la souris, prédire l'emplacement du site catalytique de la protéine. 

Nous allons colorer les acides aminés grâce à un code qui reflète leurs propriétés chimiques. 

    * Yellow: résidus aliphatiques hydrophobes.
    * Green: résidus aromatiques.
    * Blue: Résidus chargés positivement. 
    * Red: Résidus chargés négativement.
    * Cyan: Résidus hydrophiles. 
    * Pink: résidus particulier.
    * Smudge: glycine.

PyMol offre l'option pour effectuer des mesures géométriques de distance et angles. Il est aussi possible de générer l'inventaire des liaisons non covalentes pour un atome ou un groupe d'atome appartenant à un seul objet.

Pour mesurer la distance, en utilisant la ligne de commande: 

```
select bond1, resi 337+41
zoom bond1
distance dis1, resi 41, resi 337, 4, 2
```

Effectuer la même mesure pour les résidus 392 et 389.

### Générer les figures 
Le *"ray tracing"* est un ensemble de traitement effectué sur les objets 3D pour amener la scène à un aspect réaliste. Parmi ces traitements on cite, le lissage, l'ombrage, la reflection de la lumière et d'autres. 
On pourra utiliser la ligne de commande pour effectuer le *ray tracing*: 

```
select sele, resn CA
zoom sele
show spheres, sele
select prox, sele around 5
select complete, byres prox
create around4, complete
color slate, resn CA
set cartoon_transparency, 0.80
set ray_trace_mode, 1
ray
```

## Modélisation comparative
Au cours de ce tutorial, nous allons modéliser par approche comparative la alpha-amylase de Alteromonas
haloplanktis. Cette bactérie est de type Gram- qui pousse exclusivement à des températures très basse de -20 degrés C dans les régions antarctiques. \par
Les étapes de la modélisation comparative (par homologie), consiste à (1) obtenir la séquences cible, (2) Identifier une structure homologue, (3) effectuer un alignement entre la séquence cible et la séquence du template, (3) construire le modèle et, (4) évaluer le modèle. Pour plus d'informations, consultez la revue par [Muhammed et Yalcin]((2018, DOI: 10.1111/cbdd.13388)).

### Identification de la séquence cible
Selon les informations offertes dans les paragraphes précédents, identifier la séquence cible de la protéine à modéliser en effectuant une requête sur la base de données Uniprot.  Enregistrer la séquence en format FASTA. 

### Identifier la structure template et alignement
Naviguer vers le site [swissmodel.expasy.org](swissmodel.expasy.org) puis cliquer sur le bouton 'Start Modeling'. Coller la séquence cible dans le champ 'Target Sequence'. Par la suite appuyer sur 'Search for templates'.
Quel template sera sélectionné pour effectuer la modélisation moléculaire (Ne choisir aucune structure ayant plus de 99\% d'identité de séquence)? Justifier votre choix. 
Pour vérifier l'alignement cliquez sur l'onglet 'Alignment of Selected Templates'.

### Construction du modèle
Sélectionner le template désiré puis appuyer sur le bouton 'Build Model' dans la partie droite de votre écran. Quant la modélisation se termine, télécharger la structure du modèle en cliquent sur 'Button 01' puis 'PDB format'. 

### Vérification de la qualité du modèle
L'étape de l'évaluation de la qualité du modèle nécessite les informations sur la fiabilité de la prédiction pour détecter les régions anormales. On vérifiera alors la qualité globale et la qualité locale du modèle. Le serveur Swiss Model propose des solutions internes pour calculer la qualité du modèle. En cliquant sur 'Structure assessement' vous pouvez calculer le diagramme de Ramachandran et le profil QMean.
Dans cette étape, on utilisera aussi le serveur Verify3D pour évaluer la qualité locale du modèle. Pointer alors le navigateur sur cette addresse [https://www.doe-mbi.ucla.edu/verify3d/](https://www.doe-mbi.ucla.edu/verify3d/)
Générer le rapport de la qualité du modèle et interpréter. 

### Analyse du modèle}
Pour vérifier la fiabilité du modèle construit, nous allons effectuer une superposition structurale par rapport à la structure réelle (code PDB: 1AQM) et par rapport à la structure du template (Dans mon cas, c'est la structure porcine 1KXQ).
La superposition nécessite une structure référence figée et une structure mobile à superposer. Vous pouvez effectuer cette étape en allant vers le bouton 'Action' de la structure mobile puis 'align', 'to molecule' et finalement choisissez votre structure référence.
La superposition pourrait aussi être effectuée grâce à la ligne de commande. 

```
select reference, 1AQM and name CA
select your_model, model_ID and name CA
align your_model, reference
```

## Etude de cas: analyse des mutations
Dans cette partie nous allons effectuer des mutations au sein de la protéine selon les étapes suivantes:
* Générer la structure avec PyMOL.
* Minimiser l'énergie de la structure avec (Chrion)[https://dokhlab.med.psu.edu/chiron/processManager.php].
* Analyser la structure avec PyMOL.

### Cas 1
* Téléchargez et nettoyer la structure de la Laminine A (PDB code 1IFR).
* Effectuez la mutagenèse du résidue R527 en Asn.

### Cas 2 
* Téléchargez seulement la chaine B de la Bacteriorhodopsin (code PDB: 1S51).
* Nettoyer la structure et effectuez la mutagenèse du résidue P91 en Gly.

### Cas 3
* Téléchargez la structure du domaine catalytique de la MMP-2 (code PDB: 3AYU).
* Effectuer la mutation His 124 en Arg, cette fois, sans raffiner le modèle.

### Cas 4
La protéine UNC119 est impliqué dans la détection synaptique des cellules photoréceptrices. 
* Téléchargez sa structure en utilisant le code PDB 3RBQ (chaine C seulement). 
* Effectuer la mutation E163 en Leu sans le raffinement du modèle.

### Cas 5
Le récepteur Glucocorticoide est un facteur de transcription qui se intéragit avec une séquence spécifique de l'ADN. 
* Téléchargez la structure 3G6P. 
* Muter le résidu Arg 496 en Asp sur les deux monomère de la structure WT. 
* Enregistrer les deux structures WT et Mut.
* Raffiner le modèle puis générer la carte du potentiel électrostatique. 
