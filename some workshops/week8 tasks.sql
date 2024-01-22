SELECT PName from project
WHERE PID IN (SELECT PID from employee);  -- task 1

SELECT Ename, Pname FROM employee e INNER JOIN project p on e.PID = p.PID; -- task 2
-- NATURAL join is an inner join where the join is created between any matching columns within the tables, so here by PID

SELECT Ename, Pname FROM employee e INNER JOIN project p on e.PID = p.PID
WHERE p.PID = '21';
-- task 3

SELECT Ename, Pname FROM employee e LEFT JOIN project p ON e.PID = p.PID;
-- task 4
-- LEFT (outer) join produces set of records of employee table with matching records from projoect.
-- as such the right side for Ename: James , contains null. 

SELECT Ename, Vmodel FROM employee e LEFT JOIN vehicle v on e.EID = v.EID;
-- task 5
-- LEFT join again produces NULL statements for employees that have not been assigned a car.

SELECT Ename, Mname, Pname FROM employee e
JOIN project p on e.PID = p.PID
JOIN manager m on m.PID = p.PID
-- task 6




 




