
-- 1. Create a new user (replace 'floorcool_app' with an appropriate username)
CREATE USER 'floorcool_app'@'%' IDENTIFIED BY '26Zgygp|z1pgqSj}xx]5';

-- 2. Revoke any potential global privileges (if any were assigned before)
REVOKE ALL PRIVILEGES ON *.* FROM 'floorcool_app'@'%';

-- 3. Grant only SELECT, INSERT, UPDATE, and DELETE privileges on the specified database
GRANT SELECT, INSERT, UPDATE, DELETE
ON FloorCoolingSystem.*
TO 'floorcool_app'@'%';

-- 4. Apply the changes immediately
FLUSH PRIVILEGES;

-- 5. (Optional) Verify the user’s privileges
SHOW GRANTS FOR 'floorcool_app'@'%';
