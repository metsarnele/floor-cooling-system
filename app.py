import time
import os
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()
TEMP_THRESHOLD = float(os.getenv("TEMP_THRESHOLD"))

def fetch_temperature():

    try:
        return 22  # Example temperature value
    except Exception as e:
        print(f"Error fetching temperature: {e}")
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
    time.sleep(3600)  # Wait for 1 hour before checking again
