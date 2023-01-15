#!/bin/bash

# Salve sua chave API da OpenWeatherMap como uma variável
api_key="5bed31ea4e60683c92c8e43bf0fd0976"

# Obtenha as informações do tempo para Guarulhos
weather=$(curl -s "http://api.openweathermap.org/data/2.5/weather?q=Guarulhos,br&units=metric&appid=$api_key")

# Extraia o ícone do tempo e a temperatura
icon=$(echo $weather | jq -r ".weather[0].icon")
temp=$(echo $weather | jq ".main.temp")

# Exiba as informações
echo " +$temp C"
