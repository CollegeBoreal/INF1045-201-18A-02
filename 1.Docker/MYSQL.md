# Docker

. Installer MySQL

```
$ docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=password -p 3306:3306 -d mysql:latest 
```

. Executer la commande d'accer a MySQL

```
$ docker exec -it some-mysql bash
```

Dans le container:

. lancer le CLI (Command Level Interface) de MySQL

```
# mysql -u root -p 
```

. Dans le CLI

.. créer une base de données


```
mysql> CREATE DATABASE etudiants;
```

.. créer les utilisateurs

Version Longue

```
mysql> CREATE USER 'etudiants'@'localhost' IDENTIFIED BY 'etudiants_1';
mysql> GRANT ALL ON etudiants.* TO 'etudiants'@'localhost';
```

Version Simplifiee incluant tous les hotes

```
mysql> GRANT ALL ON etudiants.* TO 'etudiants'@'%' IDENTIFIED BY 'etudiants_1';
```

* Download Editeur MySQL

https://www.mysql.com/fr/products/workbench/
