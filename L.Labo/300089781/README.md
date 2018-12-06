## Introduction sur le VPN
Le VPN (Virtual Private Network) sert a pouvoir accéder à Internet en toute sécurité depuis votre ordinateur lorsque vous êtes connecté à un réseau non sécurisé et permet de traverser ces réseaux non approuvés de manière sécurisée. Le VPN dissimule souvent votre adresse IP réelle, il entraînera presque certainement l'obtention d'une adresse IP différente, il protégera les données que vous transférez via le WiFi public et permet de masquer notre position actuelle. Par exemple, avec le VPN, les utilisateurs peuvent choisir le pays d'origine de leur connexion Internet.

## Prérequis pour installer un VPN :warning:
:small_red_triangle: Avoir au moins deux machines génériques (containers) à votre disposition. Un pour jouer le rôle du serveur (pour moi par exemple, az-cb-prod) et une pour jouer le rôle du client (cb-dev). 
:small_red_triangle: je vous suggère d'ouvrir plusieurs fenêtre terminal (au moins 3) pour pouvoir se connecter avec deux d'entres elles sur les deux machines en question (az-cb-prod & cb-dev) et puis l'autre fenêtre servira à faire les commandes qui suivent.

:triangular_flag_on_post: Petite parenthèse: Tout au long de mon projet, je devais changer de prompt pour donner la permission à certaines de mes commandes de pouvoir s'exécuter. C'est donc avec le ```sudo``` que je peux faire cela: prompt #.

## Commençons !
:one: SSH. Activez le serveur et le client en utilisant la commande SSH. Par exemple, voici la commande que j'ai fais pour partir mon serveur (az-cb-prod) et mon client (cb-dev) sur deux terminaux différents:
```
$ docker-machine ssh az-cb-prod
```
```
$ docker-machine ssh cb-dev
```
:two: Sur le serveur az-cb-prod, nous allons commencer par installer OpenVPN en utilisant la commande ```apt```. Nous installerons également le package easy-rsa, ce qui nous aidera à configurer une autorité de certification interne à utiliser avec notre VPN. 
```
$ sudo apt-get update
```
```
$ sudo apt-get install openvpn easy-rsa
```
:three: Activer sur le serveur un pare-feu qui bloque tous les ports autres que 22 (SSH) et 1194 (le port OpenVPN par défaut). Remarqué que le prompt est rendu #, cela veut dire qu'il fallait être "rooté" pour pouvoir faire ces commandes (avoir une permission spéciale).
```
# ufw enable
# ufw allow 22
# ufw allow 1194
```
:four: Toujours sur le serveur, il faut aller suprimer une ligne qui se trouve dans le fichier ```sysctl.conf```. Cela va permettre le routage interne entre les interfaces réseau sur le serveur. Pour commencer, il faut se mettre en mode "sudo", car sinon vous ne serait pas en mesure de pouvoir faire des changements dans la page et puis entrer dans /etc/ en fesant "cd".
```
# nano /etc/sysctl.conf
```
:five: Pour charger le nouveau paramètre, exécutez sysctl -p.
```
# sysctl -p
```
:ok: L'environnement serveur est maintenant configuré et prêt à générer les clés serveur. Voici les prochaines étapes à suivre:

:one: Lorsque nous avons installé OpenVpn, un répertoir /etc/openvpn c'est créé automatiquement. Ils viennent avec des configurations de bases qui faudra changer avec nos propres informations. Voici les commandes à faire:
```
# cp -r /usr/share/easy-rsa/ /etc/openvpn
```
```
# nano /etc/sysctl.conf
```
![Alt_tag](vars.png)

:two: 
