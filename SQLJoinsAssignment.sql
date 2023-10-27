/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */

SELECT * FROM products as p
INNER JOIN categories as c
ON p.CategoryID = c.CategoryID
WHERE c.Name = "computers";
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */

SELECT p.Name, p.Price, r.Rating FROM products as p
INNER JOIN reviews as r
ON p.ProductID = r.ProductID
WHERE r.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */

SELECT  e. EmployeeID, e.FirstName, e.LastName, SUM(s.Quantity) as 'Total Sales' FROM employees as e
INNER JOIN sales as s
ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID
ORDER BY SUM(s.Quantity) DESC
LIMIT 5;

/* joins: find the name of the department, and the name of the category for Appliances and Games */

SELECT d.DepartmentID, d.Name as 'Department Name', c.Name as 'Category Name' FROM departments as d
INNER JOIN categories as c
ON d.DepartmentID = c.DepartmentID
WHERE c.Name = "Appliances" OR c.Name = "Games";

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 
SELECT p.ProductID, p.Name, Sum(s.Quantity) as "Total # Sold", Sum(s.PricePerUnit) as "Total Price Sold" FROM products as p
INNER JOIN sales as s
ON p.ProductID = s.ProductID
WHERE p.Name LIKE "%hotel california%"
GROUP BY P.ProductID;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */

SELECT p.ProductID, p.Name, r.Reviewer, r.Rating, r.Comment FROM products as p
INNER JOIN reviews as r
ON p.ProductID = r.ProductID
WHERE P.Name LIKE "%visio%" AND r.Rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */

SELECT e.employeeID, e.FirstName, e.LastName, p.Name, s.Quantity FROM employees as e
INNER JOIN sales as s
ON e.EmployeeID = s.EmployeeID
INNER JOIN products as p
ON s.ProductID = p.ProductID
ORDER BY e.EmployeeID ASC;