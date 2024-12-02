-- Count total activities in the last month
SELECT COUNT(*) AS total_activities_last_month
FROM ActivityLog
WHERE timestamp >= NOW() - INTERVAL 1 MONTH;

-- Calculate average temperature logged in the last month
SELECT AVG(temperature) AS average_temperature
FROM temperaturelog
WHERE timestamp >= NOW() - INTERVAL 1 MONTH;

-- Count users who have set passwords
SELECT SUM(CASE WHEN password IS NOT NULL AND password != '' THEN 1 ELSE 0 END) AS total_passwords
FROM Users;
