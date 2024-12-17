-- Trigger for auditing changes in Users
CREATE TABLE users_log (
   id INT AUTO_INCREMENT PRIMARY KEY,
   user_id INT NOT NULL,
   old_email VARCHAR(191),
   new_email VARCHAR(191),
   changed_by VARCHAR(255),
   changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER after_users_update
AFTER UPDATE ON Users
FOR EACH ROW
BEGIN
   INSERT INTO users_log (user_id, old_email, new_email, changed_by, changed_at)
   VALUES (OLD.user_id, OLD.email, NEW.email, USER(), NOW());
END;

-- Trigger for data integrity in Users
CREATE TRIGGER before_users_insert
BEFORE INSERT ON Users
FOR EACH ROW
BEGIN
   IF NEW.email NOT REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$' THEN
       SIGNAL SQLSTATE '45000'
       SET MESSAGE_TEXT = 'Invalid email address format.';
   END IF;

   IF NEW.username IS NULL OR NEW.username = '' THEN
       SIGNAL SQLSTATE '45000'
       SET MESSAGE_TEXT = 'Username cannot be empty.';
   END IF;
END;
