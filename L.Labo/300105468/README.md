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

## 🔎CRÉATION D'UTILISATEUR SAMBA 
Rappel: les comptes doivent déjà être créés sous linux avec la commande adduser .

Pour créer les comptes Samba, il faut utiliser la commande:

```smbpasswd -a MonCompte MonMotdePasse```
Cette commande ajoute le compte SAMBA MonCompte avec le mot de passe MonMotDePasse.

Il est possible ensuite dans la section "Share définitions" d'ajouter des partages accessibles seulement à certains utilisateurs par exemple pour le répertoire /home/administration :

``` [administration]
path=/home/administration
public = no
valid users = pierre  @admin
writable = yes
create mask = 0770
 ```
 Le paramètre @admin permet de donner des droits aux membres du groupe système admin.
 
Le répertoire /home/administration doit être créé sous linux avec les droits adéquats , par exemple:

 ```mkdir /home/administration
chown pierre:admin /home/administration
chmod 770 /home/administration
```
# Un problème à éviter:

Le compte utilisateur SAMBA dispose de moins de privilèges que le compte root. Si vous partagez un répertoire et que vous faites les manipulations sous le compte root, faites attention aux droits, car si root est propriétaire (chmod 700), le client SAMBA ne pourra pas accéder au disque.Les droits SAMBA ne peuvent pas outrepasse les droits Linux, cf exemple ci-dessus pour donner des droits.

Voir man smbpasswd ou smbpasswd --help pour le mode d'utilisation de la commande.

Remarques :

* Les manipulations peuvent paraître fastidieuses si vous avez un grand nombre de comptes utilisateurs à créer.

* Si vous disposez de nombreux comptes d'utilisateurs sur votre système Linux, il est possible de créer sans difficulté un script qui, a partir d'un fichier texte crée les comptes systèmes et les comptes SAMBA (voir à la fin du TP Samba).

Accès depuis un poste client Linux
Il est possible d'y accéder graphiquement avec le navigateur konqueror et le protocole smb en utilisant l'url suivante : smb://@ip-du-serveur/nom-partage ou smb://@ip-du-serveur/
http://www.linux-france.org/prj/edu/archinet/systeme/images/smb_linux1.png
Figure 25.1. Accès à un serveur SAMBA à partir d'un client Linux par méthode graphique.

Accès à un serveur SAMBA à partir d'un client Linux par méthode graphique.

