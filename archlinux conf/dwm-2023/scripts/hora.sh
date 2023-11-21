#!/bin/bash

while true; do
    # Obtém a data e hora no formato especificado
    data_hora=$(date +'%d/%m/%Y-%H:%M:%S')

    # Exibe a data e hora
    echo " $data_hora"

    # Aguarda 1 segundo antes de exibir a próxima atualização
    sleep 1
done

