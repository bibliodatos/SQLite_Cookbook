-- Example 4.3 Overriding default values using NULL

SAVEPOINT "RESTOREPOINT";

CREATE TABLE D (id integer default 0, foo varchar(10));

-- Use NULL instead of default
INSERT INTO D(id, foo) VALUES(NULL, 'Brighten');

ROLLBACK TO SAVEPOINT "RESTOREPOINT";

-- No difference between SQLite and MySQL
