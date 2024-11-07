import time
import os
import logging
import requests
from dotenv import load_dotenv
from datetime import datetime

# Load environment variables from .env file
load_dotenv()
TEMP_THRESHOLD = float(os.getenv("TEMP_THRESHOLD"))
OPENWEATHERMAP_API_KEY = os.getenv("OPENWEATHERMAP_API_KEY")
LOCATION = os.getenv("LOCATION")
RETRIEVAL_INTERVAL = int(os.getenv("RETRIEVAL_INTERVAL"))
API_URL = f"http://api.openweathermap.org/data/2.5/weather?q={LOCATION}&appid={OPENWEATHERMAP_API_KEY}&units=metric"

# Set up logging
logging.basicConfig(
    filename='temperature_log.txt',
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)

def fetch_temperature():
    try:

        response = requests.get(API_URL)
        response.raise_for_status()
        data = response.json()


        temperature = data['main']['temp']
        logging.info(f"Successfully retrieved temperature: {temperature}°C for location: {LOCATION}")  # NEW: Log success
        return temperature
    except requests.exceptions.RequestException as e:
        logging.error(f"Error fetching temperature: {e}")
        return None

def check_temperature(temperature):
    if temperature is not None:
        print(f"Current temperature is: {temperature}°C")

        if temperature > TEMP_THRESHOLD:
            print("The outside temperature exceeds the threshold.")
            print("Switching heat pump to cooling mode and turning it on.")
        else:
            print("The outside temperature is at or below the threshold.")
            print("Floor cooling remains off.")
    else:
        print("Failed to retrieve a valid temperature.")

# Infinite loop to check the temperature every hour
while True:
    current_temperature = fetch_temperature()
    check_temperature(current_temperature)
    time.sleep(RETRIEVAL_INTERVAL)
