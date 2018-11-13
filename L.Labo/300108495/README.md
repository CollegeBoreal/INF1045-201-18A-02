# Building a MediaWiki server

 MediaWiki est un excellent moyen d’illustrer le processus de construction d’un
serveur Web (souvent appelé serveur LAMP) sous Linux.

# Steps:

Voici une liste de ce que vous devez faire pour atteindre votre objectif:
1 Installez Apache
2 Installez le langage de script PHP côté serveur.
3 Ajoutez une ou deux pages Web à la racine du document Web.
4 Installez un moteur SQL (mysql dans ce cas)
5 Installer et configurer MediaWiki

# 1st step : Install Apache2 

```
$ sudo apt update
$ sudo apt install apache2

```
L’URL que vous utiliserez pour accéder à un site Apache exécuté sur votre poste de travail.
est localhost. Si, à la place, vous avez choisi de travailler sur un conteneur LXC ou Virtual
Box VM, vous utiliserez l’adresse IP de la machine pour l’URL.
 pic

 # 2nd step : Install PHP
 
 ```
$ sudo apt install php

```
vous pouvez changer aussi le fichier mais il faust recommencer Apache2 

```
$ sudo /etc/init.d/apache2 restart
$ sudo nano var/www/html/test.php
```
vous pouvez ecrire une simple paragraphe afin de tester le php 

```
<?php> echo 'IT WOKRS'; ?>
```
et vous pouvez le tester avec l URL de localhost/test.php

# 3rd Step : Install Mysql

A cette etape vous devez configurer le password de votre conteneur mysql

```
$ sudo apt install mysql-server
```
Acceder a votre conteneur

```
$ mysql -u root -p
```
```
mysql> CREATE DATABASE companydb;
```
