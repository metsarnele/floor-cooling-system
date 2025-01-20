CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    product VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
-- Begin transaction
BEGIN;

-- Inserting data into the users table
INSERT INTO users (username, email) VALUES ('john_doe', 'john@example.com');

-- Inserting data into the orders table (this will fail because user_id does not exist)
-- This query will fail as user_id should reference an existing user
INSERT INTO orders (user_id, product, price) VALUES (999, 'Floor Heater', 200.00);

-- If everything is successful, commit the transaction
COMMIT;

-- If there is an error, rollback the transaction
ROLLBACK;

-- Successful insertion into users and orders tables after rollback
INSERT INTO users (username, email) VALUES ('john_doe', 'john@example.com');
INSERT INTO orders (user_id, product, price) VALUES (1, 'Floor Heater', 200.00);

-- Begin new transaction for another user
BEGIN;

-- Inserting new user and order
INSERT INTO users (username, email) VALUES ('poyn_don', 'don@example.com');
INSERT INTO orders (user_id, product, price) VALUES (2, 'Floor Heaters', 210.00);

-- Commit the changes
COMMIT;