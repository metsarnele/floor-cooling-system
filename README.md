# Temperature Monitoring Script

This Python script checks the temperature and decides whether to turn on the floor cooling system based on a specified threshold. The script continuously monitors the temperature every hour in an infinite loop.

## What It Does
Temperature Monitoring: Checks the temperature at intervals specified in the `.env` file.<br>
Threshold-Based Control: Compares the current temperature to a set threshold and turns on the cooling if the temperature exceeds it.<br>
API Integration: Fetches real-time temperature data using the OpenWeatherMap API.<br>
Logging: Logs temperature data and any errors to a `temperature_log.txt` file.<br>
Environment Configuration: Uses a `.env` file to set the temperature threshold, API key, location, and data retrieval interval.<br>

## Explanation of Parameters
`TEMP_THRESHOLD`: Sets the temperature threshold in Celsius. If the outside temperature rises above this value, the cooling system will activate. This value is read from the `.env` file.<br>

Example: `TEMP_THRESHOLD=25` will turn on cooling when the temperature exceeds 25°C.<br>
`API_KEY`: Your API key for the weather service (e.g., OpenWeatherMap). This key is required to fetch temperature data from the API.<br>

Example: `API_KEY`=your_api_key_here<br>
`LOCATION`: The location (city, region, or other acceptable identifier) for which to retrieve the temperature.<br>

Example: `LOCATION`=London,UK<br>
`RETRIEVAL_INTERVAL`: The interval (in seconds) at which the script retrieves the temperature data. This allows for flexible monitoring intervals.<br>

Example: `RETRIEVAL_INTERVAL`=3600 (for an hourly check)

## Usage

### Setup:

Ensure Python 3 is installed.

### Install dependencies:

`pip install python-dotenv`

### Configuration:

In the project directory, ensure the `.env` file includes the desired temperature threshold, API key and retrieval interval, for example:<br>

`TEMP_THRESHOLD=21`<br>
Replace 21 with your desired temperature threshold in Celsius.

### Run the Program:

`python floor_cooling_system.py`<br>
The program will continuously monitor the temperature at the specified interval, log the data to temperature_log.txt, and control the cooling system based on the specified threshold.

### Logging
Temperature Data: The script logs each successful temperature retrieval along with the timestamp.
Error Logging: If there is an issue with fetching the temperature data, the error will be logged in temperature_log.txt.

### Notes
Ensure that the `temperature_log.txt` file is created automatically by the script or verify that the script has permission to write to the project directory.
The OpenWeatherMap API requires a valid API key, so make sure to sign up and get your key if you don’t have one.