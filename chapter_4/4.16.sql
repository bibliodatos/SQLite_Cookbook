-- Example 4.16 Deleting duplicate records

-- set up our data
CREATE TABLE dupes (id INTEGER, name TEXT);
INSERT INTO dupes VALUES (1, 'NAPOLEON');
INSERT INTO dupes VALUES (2, 'DYNAMITE');
INSERT INTO dupes VALUES (3, 'DYNAMITE');
INSERT INTO dupes VALUES (4, 'SHE SELLS');
INSERT INTO dupes VALUES (5, 'SHE SELLS');
INSERT INTO dupes VALUES (6, 'SHE SELLS');
INSERT INTO dupes VALUES (7, 'SHE SELLS');

-- delete duplicate items
DELETE FROM dupes
WHERE id NOT IN
 (SELECT min(id)
  FROM (SELECT id, name FROM dupes) AS tmp
  GROUP BY name
);

DROP TABLE dupes;

-- No difference between SQLite and MySQL

DROP TABLE dupes;
