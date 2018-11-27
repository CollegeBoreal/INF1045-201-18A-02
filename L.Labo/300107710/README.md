
Securing your web server

1.	SCANNING FOR OPEN PORTS
Vérification des ports ouverts
````
$ netstat -npl
````

2.	FIREWALL
  2.1  Vérifier l’ état du firewall de votre serveur
````
$ sudo firewall-cmd --state 
````
 Running
By default, firewalld will be active and will reject all incoming traffic with a couple of exceptions, like SSH. 
  2.2 Liste des services autorisés par le Firewall
````
$ sudo firewall-cmd --list-services
````
ssh dhcpv6-client
  2.3 Ajouter d'autres services    
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
success

$ firewall-cmd --permanent --add-service=https
success

$ firewall-cmd --reload
success
````
  2.3 Verifier les services ajoutés dans le firewall
````
$ firewall-cmd --list-services
````
ssh dhcpv6-client http https







