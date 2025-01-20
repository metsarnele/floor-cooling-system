-- 1. Create 'customers' table to store customer information
CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Unique customer ID
    first_name VARCHAR(255) NOT NULL, -- Customer's first name
    last_name VARCHAR(255) NOT NULL, -- Customer's last name
    address VARCHAR(255) NOT NULL -- Customer's address
);

-- 2. Create 'cooling_systems' table to store cooling systems orders
CREATE TABLE cooling_systems (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Unique cooling system ID
    customer_id INT NOT NULL, -- Customer's ID (foreign key)
    system_model VARCHAR(255) NOT NULL, -- Cooling system model
    power INT NOT NULL, -- Cooling system power (e.g., watts)
    FOREIGN KEY (customer_id) REFERENCES customers(id) -- Foreign key to 'customers' table
);

-- 3. Create 'accessories' table to store accessories for cooling systems
CREATE TABLE accessories (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Unique accessory ID
    customer_id INT NOT NULL, -- Customer's ID (foreign key)
    accessory_name VARCHAR(255) NOT NULL, -- Name of the accessory
    quantity INT NOT NULL, -- Quantity of the accessory
    FOREIGN KEY (customer_id) REFERENCES customers(id) -- Foreign key to 'customers' table
);

-- 4. Insert data into 'customers' table
INSERT INTO customers (first_name, last_name, address) VALUES
('Den', 'Popov', 'Punane 5, Tallinn'),
('Jane', 'Smith', 'Kollane 16, Jüri'),
('Bob', 'Johnson', 'Roheline 4, Tapa');

-- 5. Insert data into 'cooling_systems' table
INSERT INTO cooling_systems (customer_id, system_model, power) VALUES
(1, 'CoolMaster 2000', 5000),
(2, 'AirFlow 300', 4500),
(3, 'CoolBreeze 500', 6000);

-- 6. Insert data into 'accessories' table
INSERT INTO accessories (customer_id, accessory_name, quantity) VALUES
(1, 'Thermostat', 2),
(2, 'Air Filter', 3),
(3, 'Remote Control', 1);

-- 7. Select query to join 'customers', 'cooling_systems', and 'accessories' tables
-- This will return the customer's name, cooling system model, and accessory details
SELECT
    customers.first_name,
    customers.last_name,
    cooling_systems.system_model,
    cooling_systems.power,
    accessories.accessory_name,
    accessories.quantity
FROM customers
INNER JOIN cooling_systems ON customers.id = cooling_systems.customer_id
INNER JOIN accessories ON customers.id = accessories.customer_id
ORDER BY customers.last_name, customers.first_name;