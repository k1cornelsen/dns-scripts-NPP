# dns-scripts-NPP
Scripts utilizados para a confecção dos laboratórios do curso Novo Pentest Profissional.


Ferramentas podem auxiliar caso o script demore, sendo elas citadas abaixo:

dig -t ns businesscorp.com.br +short
dig -t axfr businesscorp.com.br @ns2.businesscorp.com.br
dnsenum --enum businesscorp.com.br
dnsrecon -d businesscorp.com.br
fierce -dns businesscorp.com.br

cd/usr/share/dns -> Ferramentas no Kali
