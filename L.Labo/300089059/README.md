
Il existe plusieurs maniere de partager des fichiers sur le net. Les plus connus sont DropBox ou encore Google Drive.Contraite c est que c est limiter et pas "SUR".NEXTCLOUD est une des solutions open source, et surtout "SUR". 
Vous pouvez l’installer sur un server, ou sur une machine virtuelle (VM).

Pre-requis

Ubuntu 16.04/18.04 LTS (recommended)

MySQL or MariaDB 5.5+ (recommended)

Apache 2.4 with mod_php or php-fpm (recommended)

PHP. 

https://docs.nextcloud.com/server/14/admin_manual/installation/system_requirements.html

etapes:

 Installez Apache

 Installez le langage PHP.

 Installez un moteur SQL (mysql ou MDB)

 Installez NEXTCLOUD 







1-Installer Appache 2.0(version)

C'est le serveur HTTP le plus utilise du Web.

``` 
$ sudo apt update
$ sudo apt install apache2
```
Bon a savoir:
il faut Utiliser comme URL localhost. Si vous etes sur Virtual Box VM, c est l’adresse IP de la machine.

2-Installer PHP

```$ sudo apt install php

$ sudo apt install libapache2-mod-php ```





