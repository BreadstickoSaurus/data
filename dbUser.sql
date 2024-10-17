CREATE USER editor@localhost IDENTIFIED BY 'editor';
GRANT SELECT, INSERT, UPDATE, DELETE ON game_collections.* TO editor@localhost;
FLUSH PRIVILEGES;