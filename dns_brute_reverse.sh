#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Uso: $0 <endereço_ip_inicial> <endereço_ip_final>"
    exit 1
fi

start_ip=$1
end_ip=$2

# Verifica se os endereços IP fornecidos são válidos
if ! [[ "$start_ip" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ && "$end_ip" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "Endereço IP inválido."
    exit 1
fi

# Extrai os octetos dos endereços IP inicial e final
IFS='.' read -r -a start_ip_octets <<< "$start_ip"
IFS='.' read -r -a end_ip_octets <<< "$end_ip"

# Verifica se os endereços IP fornecidos são válidos
for octet in "${start_ip_octets[@]}" "${end_ip_octets[@]}"; do
    if ! [[ "$octet" =~ ^[0-9]+$ && "$octet" -ge 0 && "$octet" -le 255 ]]; then
        echo "Endereço IP inválido."
        exit 1
    fi
done

# Varre o intervalo de endereços IP
for ((i=${start_ip_octets[3]}; i<=${end_ip_octets[3]}; i++)); do
    ip_address="${start_ip_octets[0]}.${start_ip_octets[1]}.${start_ip_octets[2]}.$i"
    host -t ptr "$ip_address" | cut -d " " -f 5
done
