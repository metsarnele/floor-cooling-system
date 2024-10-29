# Temperature Monitoring Script

This Python script checks the temperature and decides whether to turn on the floor cooling system based on a specified threshold. The script continuously monitors the temperature every hour in an infinite loop.

## What It Does
Temperature Monitoring: Checks the temperature every hour.<br>
Threshold-Based Control: Compares the current temperature to a set threshold and turns on the cooling if the temperature exceeds it.<br>
Environment Configuration: Uses a `.env` file to set the temperature threshold for cooling activation.<br>

## Usage

### Setup:

Ensure Python 3 is installed.

### Install dependencies:

`pip install python-dotenv`

### Configuration:

In the project directory, ensure the `.env` file includes the desired temperature threshold, for example:<br>

`TEMP_THRESHOLD=21`<br>
Replace 21 with your desired temperature threshold in Celsius.

### Run the Program:

`python floor_cooling_system.py`<br>
The program will continuously monitor the temperature and control the cooling system based on the specified threshold.
