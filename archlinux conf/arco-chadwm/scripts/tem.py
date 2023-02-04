#!/bin/python

import requests
import json

city_name = "Guarulhos"
api_key = "5bed31ea4e60683c92c8e43bf0fd0976"

def get_weather_data(city_name, api_key):
    url = f"http://api.openweathermap.org/data/2.5/weather?q={city_name}&appid={api_key}"
    response = requests.get(url)
    weather_data = response.json()
    return weather_data

def get_temperature(weather_data):
    temperature = weather_data["main"]["temp"]
    temperature_celsius = temperature - 273.15
    return temperature_celsius

weather_data = get_weather_data(city_name, api_key)
temperature = get_temperature(weather_data)
print(f" +{temperature:.2f}C ")

