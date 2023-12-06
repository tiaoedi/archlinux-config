#!/bin/bash

while true; do
  
     
    # Obter informações de uso da CPU usando mpstat
    mpstat 1 1 | awk '$12 ~ /[0-9.]+/ { print "CPU: " 100 - $12 "%"}'

    # Aguarde por 1 segundo antes de atualizar novamente
    sleep 1
done

