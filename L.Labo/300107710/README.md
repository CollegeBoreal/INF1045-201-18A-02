
Securing your web server(Linux Ubuntu)

1.	SCANNING FOR OPEN PORTS
Vérification des ports ouverts
````
$ netstat -npl
````

2.	FIREWALL.
2.1 Installation du Firewall.
Avant d'installer le Firewall il faut vérifier s'il est déjà installer dans votre Serveur, Sinon il faut l'installer.
Pour ce faire il faut mettre à jour votre système:
````
$ apt update
$ apt upgrade

$ apt install firewalld
````
2.2  Vérifier l’ état du firewall de votre serveur.
````
$ sudo firewall-cmd --state 
````
Running
By default, firewalld will be active and will reject all incoming traffic with a couple of exceptions, like SSH. 
2.3 Liste des services autorisés par le Firewall.
````
$ sudo firewall-cmd --list-services
````
ssh dhcpv6-client
2.4 Ajouter d'autres services.   
Pour ajouter le service http et https, pour se faire il faut avoir les privilège de l’administrateur. Cette fois aussi il faut se connecter en tant que root.
````
$ sudo -i

$ firewall-cmd --permanent --add-port=80/tcp 
$ firewall-cmd --permanent --add-port=443/tcp

$ firewall-cmd –reload
````
Si vous ne connaîsez pas les numéros des ports Vous pouvez utiliser les noms comme suit:
````
$ firewall-cmd --permanent --add-service=http 

$ firewall-cmd --permanent --add-service=https

$ firewall-cmd --reload
````

2.5 Verifier les services ajoutés dans le firewall.
````
$ firewall-cmd --list-services
````
ssh dhcpv6-client http https

3. UNCOMPLICATEDFIREWALL (UFW).

Let’s see how you can similarly control SSH access on an Ubuntu machine using ufw. The ufw program might not come installed on new Ubuntu installations and, in any case, will be disabled by default, so you’ll want to get it running:
````
$ apt install ufw
````
Because ufw starts with all ports closed, enabling it prevents you from opening a new SSH session. Any existing sessions shouldn’t be affected but, still, it’s probably a good idea to add a rule allowing SSH even before enabling ufw.
````
$ ufw allow ssh 
````
Rules updated
````
$ ufw enable    

$ sudo ufw status
````

Status: active

4. Test de sécurité.                                                                                                                   
Pour tester notre Firewall on va ajouter une régle complexe appelée --add-rich-rule qui permettera d'accepter le trafic TCP sur le port 22(SSH) prevenant uniquement du hoste Lab5 utilisant l'adresse IP 10.13.237.5
````
$ firewall-cmd --add-rich-rule='rule family="ipv4" \ source address="10.13.237.5" port protocol="tcp" port="22" accept' 
````
success






