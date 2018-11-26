## 🔎SAMBA SERVER

## 📍INTRODUCTION
Avec SAMBA vous allez mettre en place un service de partage de disque pour des clients réseau. Ceux-ci peuvent être sous Linux ou sous Windows. Nous verrons surtout la configuration du service serveur sous Linux, et la configuration des clients sous Windows.

Samba est un produit assez populaire. Il existe de plus en plus d'outils de configuration en environnement graphique qui simplifient les tâches sur un serveur en exploitation (partage de ressources, création de comptes utilisateurs). Comme nous n'en sommes pas là, nous allons réaliser les opérations manuellement.

## 📍Eléments d'installation et de configuration de SAMBA
SAMBA est installé avec le paquet fds-network sur Kubuntu Dapper. Si vous n'utilisez pas le paquet fds-network, installez les paquets manuellement. Il ne devrait normalement pas y avoir de problèmes de dépendances.

Le paquet installe principalement samba et samba-common :

* le programme nmbd qui assure la résolution de nom NetBIOS et smbd qui assure le partage de ressource SMB/CIFS dans /usr/sbin,

* le script d'initialisation dans /etc/init.d,

* un fichier de configuration /etc/samba/smb.conf,

* une documentation complète dans /usr/share/doc,

* le service de journalisation (log) dans /var/log/samba,

* des outils comme smbpasswd pour la création des comptes samba et nmblookup pour vérifier le fonctionnement de la résolution de noms NetBIOS.

La commande dpkg-reconfigure samba vous demande si samba doit être lancé en mode autonome, choisissez « oui », si un fichier /etc/samba/smbpasswd doit être créé, choisissez également « oui ». La dernière option vous permet d'avoir une base de données de compte créée automatiquement à partir de la base de compte du fichier /etc/passwd.
Faites tout de suite une sauvegarde du fichier /etc/smb.conf.

## 📍Le fichier de configuration sous Linux
Voici le fichier de configuration qui nous servira de base de travail. Il va permettre de :

définir NomDuServeur comme serveur Samba,

mettre en place l'authentification des utilisateurs.

## 📍Les étapes de la configuration du serveur
Nous allons réaliser les opérations suivantes :

* Vérifier et valider le fichier de configuration,

* Déclarer les ressources partagées,

* Créer des comptes utilisateurs pour SAMBA.

Il n'y aura plus qu'à tester la configuration à partir d'un client.

Attention, un compte système n'est pas un compte SAMBA. Faites bien la distinction entre les deux.

partager des disques et une imprimante pour un client Windows,

partager le dossier personnel d'un utilisateur sous Linux comme étant son répertoire personnel sous Windows.

Le fichier de configuration comprend essentiellement deux parties :

* une partie “ générale ” qui définit le comportement général du serveur et la stratégie adoptée pour les services communs (CPD, mode d'authentification, service WINS)...

* une partie share, qui définit les ressources partagées et les permissions d'accès.
 ## ✨étape I - Configuration du fichier smb.conf
Configurer l'environnement de samba par le fichier /etc/samba/smb.conf et demarrez le service avec la commande /etc/init.d/samba start ou restart. Cette opération doit être réalisée chaque fois que le fichier de configuration est modifié. Vérifiez la configuration à l'aide de la commande testparm | more.

Corrigez les erreurs éventuelles de configuration.
## ✨étape II - Déclarer les ressources partagées
Cette opération est réalisée dans la partie Share Definitions du fichier smb.conf. Chaque fois que vous ajoutez ou modifiez une ressource, relancez le service serveur.
Fichier de configuration d'un serveur SAMBA :

## 📍Exemple de fichier de configuration de Samba (pour un serveur simple) :
Vous trouverez de nombreuses autres options dans la documentation.

# Fichier de configuration d'un serveur SAMBA :
ntation.

===============================================================================
[global]

## Browsing/Identification ###

   workgroup = workgroup  //à remplacer par le nom de votre groupe de travail
   netbios name = NomDuServeur  //à remplacer par le nom du serveur Samba
   server string = %h server (Samba %v)
;   wins support = no
Exemple de fichier de configuration de Samba (pour un serveur simple) :
Vous trouverez de nombreuses autres options dans la docume
;   wins server = w.x.y.z
   dns proxy = no
;   name resolve order = lmhosts host wins bcast


#### Debugging/Accounting ####
   log file = /var/log/samba/log.%m

# Put a capping on the size of the log files (in Kb).
   max log size = 1000
   syslog = 0

# Do something sensible when Samba crashes: mail the admin a backtrace
   panic action = /usr/share/samba/panic-action %d

####### Authentication #######
   security = user  //nécessite une authentification pour accéder aux ressources

  encrypt passwords = true  
  passdb backend = tdbsam guest

   obey pam restrictions = yes
   invalid users = root
   passwd program = /usr/bin/passwd %u
   passwd chat = *Enter\snew\sUNIX\spassword:* %n\n *Retype\snew\sUNIX\spassword:* %n\n .
   socket options = TCP_NODELAY

#===================== Share Definitions =======================

[homes]

#permet de partager le répertoire personnel de chaque utilisateur
   comment = Home Directories
   browseable = no
   writable = yes
   create mask = 0755
   directory mask = 0755

[partage]
   comment = Ressource partagée
#le répertoire /home/partage doit exister dans l'arborescence linux
   path=/home/partage
   browseable = yes
   writable = yes
   create mask = 0777
   directory mask = 0777

[printers]
   comment = All Printers
   browseable = no
   path = /tmp
   printable = yes
   public = no
   writable = no
   create mode = 0700

# Windows clients look for this share name as a source of downloadable
# printer drivers
[print$]
   comment = Printer Drivers
   path = /var/lib/samba/printers
   browseable = yes
   read only = yes
   guest ok = no
===============================================================================
