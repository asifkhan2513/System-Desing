CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    grade INT
);

-- insert value
INSERT INTO
    students (name, grade)
VALUES ('Alice', 85),
    ('Bob', 78),
    ('Charlie', 92);


--  in this code  two transation scenario
-- transaction 1 and transation 2  split terminal  and  perform task

-- Read Uncommitted: Transaction 1 may see the new student even if Transaction 2 hasn't committed yet (dirty read).

--Read Committed: Transaction 1 will only see the new student if Transaction 2 has committed before Transaction 1's read.

--Repeatable Read: If Transaction 1 reads before Transaction 2 commits, it won't see the new student, even if it reads again.

--Serializable: Transaction 2 must wait until Transaction 1 completes before inserting, ensuring Transaction 1's result set is stable.


--Check the Current Isolation Level
SELECT @@transaction_isolation;



-- Set the Isolation Level for  Session
SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
-- Set the Isolation Level for  Session
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- Set the Isolation Level for  Session
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- Set the Isolation Level for  Session
SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- Set the Isolation Level for  Session



-- Start Transaction 1
START TRANSACTION;
-- Read the current students
SELECT * FROM students;
-- Insert a new student in Transaction 2
INSERT INTO students (name, grade) VALUES ('David', 88);
-- Commit Transaction 2
COMMIT;
-- Read the current students again in Transaction 1
SELECT * FROM students;
-- Commit Transaction 1
COMMIT;
-- Start Transaction 2
START TRANSACTION;
-- Read the current students
SELECT * FROM students;
-- Insert a new student in Transaction 1
INSERT INTO students (name, grade) VALUES ('Eve', 90);
-- Commit Transaction 1
COMMIT;
-- Read the current students again in Transaction 2
SELECT * FROM students;
-- Commit Transaction 2
COMMIT;
-- Check the final state of the students table
SELECT * FROM students;
-- Clean up the table after testing

