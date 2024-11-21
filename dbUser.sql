CREATE USER 'editor'@'%' IDENTIFIED BY 'editor';
GRANT SELECT, INSERT, UPDATE, DELETE ON game_collections.* TO 'editor'@'%';
FLUSH PRIVILEGES;