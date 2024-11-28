-- Add a `last_login` column to the `Users` table
ALTER TABLE Users
ADD COLUMN `last_login` DATETIME DEFAULT NULL;