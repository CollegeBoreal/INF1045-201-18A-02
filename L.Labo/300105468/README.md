### SAMBA SERVER

## INTRODUCTION
Avec SAMBA vous allez mettre en place un service de partage de disque pour des clients réseau. Ceux-ci peuvent être sous Linux ou sous Windows. Nous verrons surtout la configuration du service serveur sous Linux, et la configuration des clients sous Windows.

Samba est un produit assez populaire. Il existe de plus en plus d'outils de configuration en environnement graphique qui simplifient les tâches sur un serveur en exploitation (partage de ressources, création de comptes utilisateurs). Comme nous n'en sommes pas là, nous allons réaliser les opérations manuellement.

## Eléments d'installation et de configuration de SAMBA
SAMBA est installé avec le paquet fds-network sur Kubuntu Dapper. Si vous n'utilisez pas le paquet fds-network, installez les paquets manuellement. Il ne devrait normalement pas y avoir de problèmes de dépendances.

Le paquet installe principalement samba et samba-common :

le programme nmbd qui assure la résolution de nom NetBIOS et smbd qui assure le partage de ressource SMB/CIFS dans /usr/sbin,

le script d'initialisation dans /etc/init.d,

un fichier de configuration /etc/samba/smb.conf,

une documentation complète dans /usr/share/doc,

le service de journalisation (log) dans /var/log/samba,

des outils comme smbpasswd pour la création des comptes samba et nmblookup pour vérifier le fonctionnement de la résolution de noms NetBIOS.

La commande dpkg-reconfigure samba vous demande si samba doit être lancé en mode autonome, choisissez « oui », si un fichier /etc/samba/smbpasswd doit être créé, choisissez également « oui ». La dernière option vous permet d'avoir une base de données de compte créée automatiquement à partir de la base de compte du fichier /etc/passwd.
