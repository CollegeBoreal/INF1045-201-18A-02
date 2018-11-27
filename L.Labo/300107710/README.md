

Scanning for open ports
Verification des ports ouvertes
# netstat -npl

FIREWALLD

# apt update
# apt upgrade

# apt install firewalld
Si vous ne pouvez pas l’ installer essayer le préfix sudo, si non il faut se connecter en tant que root. Voici le code pour activer le compte root in ubuntu :
$ sudo -i
$ sudo passwd root
Pour désactiver l’accès par root, entrez le code suivant
$ sudo passwd -l root

Vérifier l’ état  du firewall
# sudo firewall-cmd --state 
 Running
By default, firewalld will be active and will reject all incoming traffic with a couple of exceptions, like SSH. That means your website won’t be getting too many visitors, which will certainly save you a lot on data transfer costs. As that’s probably not what you had in mind for your web server, you’ll want to open the HTTP and HTTPS ports
that, by convention, are designated as 80 and 443, respectively. Firewalld offers two ways to do that. One is through the --add-port argument that references the port number directly along with the network protocol it’ll use (TCP in this case). The --permanent argument tells firewalld to load this rule each time the server boots:
$ sudo firewall-cmd --list-services
ssh dhcpv6-client
