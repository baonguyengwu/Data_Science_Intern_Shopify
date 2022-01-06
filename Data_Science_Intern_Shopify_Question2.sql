a.	How many orders were shipped by Speedy Express in total?

/*The solution solve by using join between ORDERS and SHIPPERS table with condition from SHIPPERNAME as "Speedy Express"*/

SELECT COUNT(ORDERS.ORDERID) AS NUMBER_OF_ORDER_SPEEDY_SHIPPED
FROM ORDERS
JOIN SHIPPERS
ON ORDERS.SHIPPERID = SHIPPERS.SHIPPERID
WHERE SHIPPERS.SHIPPERNAME="Speedy Express"

Result:
Number of Records: 1
NUMBER_OF_ORDER_SPEEDY_SHIPPED
54

b.	What is the last name of the employee with the most orders?

/*Using join between two table ORDERS and EMPLOYEES, by counting ORDERID to get the most number of orders
sorting by the count of ORDERID in descending, and limit the first value*/

SELECT ORDERS.EMPLOYEEID, EMPLOYEES.LASTNAME, COUNT(ORDERS.ORDERID) AS MOST_ORDER
FROM ORDERS
JOIN EMPLOYEES
ON ORDERS.EMPLOYEEID = EMPLOYEES.EMPLOYEEID
GROUP BY EMPLOYEES.LASTNAME
ORDER BY MOST_ORDER DESC
LIMIT 1

Result:
Number of Records: 1
EmployeeID	LastName	MOST_ORDER
4		Peacock		40

c.	What product was ordered the most by customers in Germany?

/*Using the join in 4 tables PRODUCTS, ORDERDETAILS, ORDERS, CUSTOMERS, sum the number of quantity to get the Total_order
with condion from customer country in Germany, sorting the sum of quantity in descending, and limit the first value*/

SELECT PRODUCTS.PRODUCTID, PRODUCTS.PRODUCTNAME, SUM(ORDERDETAILS.QUANTITY) AS TOTAL_ORDER, CUSTOMERS.COUNTRY
FROM PRODUCTS
JOIN ORDERDETAILS
ON PRODUCTS.PRODUCTID = ORDERDETAILS.PRODUCTID
JOIN ORDERS
ON ORDERDETAILS.ORDERID = ORDERS.ORDERID
JOIN CUSTOMERS
ON ORDERS.CUSTOMERID = CUSTOMERS.CUSTOMERID
WHERE CUSTOMERS.COUNTRY = "Germany"
GROUP BY PRODUCTS.PRODUCTNAME
ORDER BY TOTAL_ORDER DESC
LIMIT 1

Result:
Number of Records: 1
ProductID	ProductName	TOTAL_ORDER	Country
40		Boston Crab Meat	160	Germany
