import time

 

def check_temperature(temperature):

    if temperature is not None:

        print(f"Current temperature is: {temperature}°C")

        if temperature >= 21:

            print("The outside temperature is +21°C or higher.")

            print("Turning on the floor cooling.")

        else:

            print("The outside temperature is below +21°C.")

            print("Floor cooling remains off.")

    else:

        print("Failed to check the temperature.")

 

# Infinite loop to check the temperature every hour

while True:

    # Replace this with actual temperature data fetching

    current_temperature = 22  # Example temperature value

    check_temperature(current_temperature)

    

    # Wait for 1 hour (3600 seconds) before checking again

    time.sleep(3600)