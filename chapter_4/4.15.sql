-- Example 4.15 Deleting referential integrity violations

-- Delete any employees whose department number is not in the department table
DELETE FROM emp
WHERE deptno NOT IN (SELECT deptno FROM dept);

-- No difference between SQLite and MySQL
