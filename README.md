# Temperature Monitoring Script

This Python script checks the current temperature and decides whether to turn on the floor cooling system based on a specified threshold. The script continuously monitors the temperature every hour in an infinite loop.

## How It Works

1. The `check_temperature()` function:
   - Accepts a temperature value and checks if it's above or below 21°C.
   - If the temperature is 21°C or higher, it prints a message indicating that the outside temperature is high enough to turn on the floor cooling.
   - If the temperature is below 21°C, it prints a message indicating that the floor cooling will remain off.
   - If the temperature value is `None`, it prints an error message.

2. **Infinite Loop**:
   - The script uses an infinite loop to repeatedly check the temperature.
   - Every hour (3600 seconds), it fetches the temperature value (currently set as a placeholder, `current_temperature = 22`), checks it using the `check_temperature()` function, and then waits an hour before checking again.

## How to Run

1. Ensure you have Python installed on your system.
2. Save the code to a file, for example `temperature_monitor.py`.
3. Open a terminal or command prompt, navigate to the directory containing the script, and run the following command:

   ```bash
   python temperature_monitor.py
