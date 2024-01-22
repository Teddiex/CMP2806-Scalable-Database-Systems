
DROP PROCEDURE IF EXISTS showAllRecords;
DELIMITER $$
CREATE PROCEDURE showAllRecords()
BEGIN
	SELECT * 
    FROM customers;
END$$
DELIMITER ;

CALL showAllRecords;
--------------------------

DROP PROCEDURE IF EXISTS showOrderDetails;
DELIMITER //
CREATE PROCEDURE showOrderDetails(IN item int)
BEGIN
	SELECT * 
    FROM orders
    WHERE orders.CUSTOMER_ID = item;
END //

DELIMITER ;

call showOrderDetails(3);


----------

DROP PROCEDURE IF EXISTS returnFullOrderInformation;

DELIMITER //

CREATE PROCEDURE returnFullOrderInformation(item int)
BEGIN
	SELECT * FROM customers
    INNER JOIN orders ON
    customers.ID = orders.CUSTOMER_ID
    WHERE orders.CUSTOMER_ID = item;
END //

DELIMITER ;

call returnFullOrderInformation(3);


---------------------------------------------
DROP PROCEDURE IF EXISTS getAveragePrice;
DELIMITER $$

CREATE PROCEDURE getAveragePrice(IN customer int, OUT ave INT)
BEGIN
	SELECT AVG(orders.AMOUNT)
    INTO ave
		FROM orders
		WHERE orders.CUSTOMER_ID = customer;
END$$

DELIMITER ;

call getAveragePrice(3,@ave);
SELECT @ave;
---------------------------------------------
DROP PROCEDURE IF EXISTS orderCount;
DELIMITER // 

CREATE PROCEDURE orderCount (customer int)
BEGIN
	SELECT count(*)
    FROM orders
    WHERE orders.CUSTOMER_ID = customer;
END//
DELIMITER ;

call orderCount(3);
----------------------------------------------
DROP PROCEDURE IF EXISTS orderByLocation; -- task a
DELIMITER $$

CREATE PROCEDURE orderByLocation(IN location VARCHAR(20))
BEGIN
	SELECT * FROM customers
    JOIN orders ON
    customers.ID = orders.CUSTOMER_ID
    WHERE customers.ADDRESS = location;
    
END $$

call orderByLocation('London');
DELIMITER ;



-- 

DROP PROCEDURE IF EXISTS ordersGreaterThanAmount;

DELIMITER //

CREATE PROCEDURE ordersGreaterThanAmount(In num INT)
BEGIN
	SELECT * FROM customers
    INNER JOIN orders ON
    customers.ID = orders.CUSTOMER_ID
    WHERE orders.AMOUNT > num;
    
    
END//
DELIMITER ;
CALL ordersGreaterThanAmount(2000);  -- task b

--
DROP PROCEDURE IF EXISTS ordersByAge;

DELIMITER $$

CREATE PROCEDURE ordersByAge(IN age1 int, IN age2 int)
BEGIN
	SELECT OID, AMOUNT FROM orders
    INNER JOIN(SELECT AGE, SALARY FROM customers)
    WHERE age1 < customers.AGE < age2;
END $$

DELIMITER ;

call ordersByAge(20,30);
    
    
	
	

    
    












