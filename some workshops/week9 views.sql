CREATE OR REPLACE VIEW ALLPROJ
AS SELECT Ename, Pname FROM employee e INNER JOIN project p on e.PID = p.PID;

DESCRIBE ALLPROJ;-- task 1


CREATE OR REPLACE VIEW Task2
AS SELECT Ename, Pname FROM employee e INNER JOIN project p on e.PID = p.PID
WHERE p.PID = '21';

DESCRIBE Task2; -- task 2

CREATE OR REPLACE VIEW Task3
AS SELECT Ename, Pname FROM employee e LEFT JOIN project p ON e.PID = p.PID;

DESCRIBE TASK3; -- TASK 3

CREATE OR REPLACE VIEW TASK4
AS SELECT Ename, Vmodel FROM employee e LEFT JOIN vehicle v on e.EID = v.EID;

DESCRIBE TASK4; -- TASK 4

CREATE OR REPLACE VIEW TASK5
AS SELECT Ename, Mname, Pname FROM employee e
JOIN project p on e.PID = p.PID
JOIN manager m on m.PID = p.PID;

DESCRIBE TASK5; -- TASK 5


-- DO TASK 6

