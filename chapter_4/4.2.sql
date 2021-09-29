-- Example 4.2 Inserting default values

SAVEPOINT "RESTOREPOINT";

CREATE TABLE D (id integer default 0);

-- SQLite syntax
INSERT INTO D DEFAULT VALUES;

-- MySQL syntax
INSERT INTO D VALUES();

ROLLBACK TO SAVEPOINT "RESTOREPOINT";
