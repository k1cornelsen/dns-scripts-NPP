#!/bin/bash

# Verifica se o usuário forneceu um argumento
if [ $# -eq 0 ]; then
    echo "Uso: $0 <domínio>"
    exit 1
fi

# Obtém os servidores de nomes do domínio fornecido
servers=$(host -t ns $1 | awk '{print $4}')

# Loop pelos servidores de nomes e realiza uma listagem de todos os registros DNS do domínio
for server in $servers; do 
    host -l -a $1 $server
done
