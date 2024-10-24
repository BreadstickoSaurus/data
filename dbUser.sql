CREATE USER 'editor'@'localhost' IDENTIFIED BY 'editor';
GRANT SELECT, INSERT, UPDATE, DELETE ON game_collections.* TO 'editor'@'localhost';
ALTER USER 'editor'@'localhost' IDENTIFIED WITH mysql_native_password BY 'editor';
FLUSH PRIVILEGES;