

-- 1: Find the total number of products for each product category.
SELECT "PRODCATEGORYID" , COUNT(*) as "TOTAL_COUNT" FROM PRODUCTS GROUP BY "PRODCATEGORYID"


-- Q2: top 5 most expensive products.
SELECT "PRODUCTID" , "PRICE"  FROM PRODUCTS
ORDER BY "PRICE" DESC
LIMIT 5


-- Q3: List the total sales amount (gross) for each product category.

SELECT "PRODCATEGORYID", SUM((s."GROSSAMOUNT")) AS "GROSS"  
FROM salesorders s
LEFT JOIN products p
ON s."PARTNERID" = p."SUPPLIER_PARTNERID"
GROUP BY "PRODCATEGORYID";

-- Q4: Total sales amount (gross) for each product category
SELECT "PRODCATEGORYID", SUM((s."GROSSAMOUNT")) AS "GROSS" 
FROM salesorders s
LEFT JOIN products p
ON s."PARTNERID" = p."SUPPLIER_PARTNERID"
GROUP BY "PRODCATEGORYID";

select * from products
select * from salesorders

ALTER TABLE salesorders
ALTER COLUMN "PARTNERID" SET DATA TYPE bigint

ALTER TABLE salesorders
ALTER COLUMN "PARTNERID" TYPE INTEGER USING "PARTNERID"::bigint;

ALTER TABLE salesorderitems
ALTER COLUMN "SALESORDERID" SET DATA TYPE Character Varying

SELECT trim(leading '0' from "SALESORDERID");


-- Q5: List the top 5 suppliers by total product sales.
SELECT * FROM salesorders

SELECT "PARTNERID" , COUNT(*) AS "COUNT_SALES"  FROM salesorders GROUP BY "PARTNERID"
ORDER BY "COUNT_SALES" DESC
LIMIT 5

-- Q6: Find the total number of products created by each employee.
SELECT pro."CREATEDBY" , COUNT(*) as "NUMBER_OF_PRODUCTS" , emp."NAME_FIRST" , emp."NAME_LAST" 
FROM products pro 
INNER JOIN employees emp ON pro."CREATEDBY" = emp."EMPLOYEEID"
GROUP BY  pro."CREATEDBY" , emp."NAME_FIRST" , emp."NAME_LAST"
ORDER BY "NUMBER_OF_PRODUCTS" desc;

-- Q7: List the employees who have changed product details the most.
SELECT pro."CHANGEDBY" , COUNT(*) as "NUMBER_OF_PRODUCTS" , emp."NAME_FIRST" , emp."NAME_LAST" 
FROM products pro 
INNER JOIN employees emp ON pro."CREATEDBY" = emp."EMPLOYEEID"
GROUP BY  pro."CHANGEDBY" , emp."NAME_FIRST" , emp."NAME_LAST"
ORDER BY "NUMBER_OF_PRODUCTS" desc;

-- Sales Orders Items Analysis
-- Q8: Calculate the total gross amount for each sales order.
SELECT "SALESORDERID" , "GROSSAMOUNT" FROM salesorders
ORDER BY "GROSSAMOUNT" DESC;


-- Q9: Find the sales order items for a specific product ID.
SELECT so."SALESORDERID", so."PARTNERID"  , soi."PRODUCTID" , soi."GROSSAMOUNT" FROM salesorders so
INNER JOIN salesorderitems soi ON so."SALESORDERID" = soi."SALESORDERID"; 


SELECT * FROM salesorders; 
SELECT * FROM salesorderitems; 

CREATE TABLE IF NOT EXISTS salesorderitems
(
    "SALESORDERID" bigint ,
    "SALESORDERITEM" character varying ,
    "PRODUCTID" character varying ,
    "NOTEID" character varying ,
    "CURRENCY" character varying,
    "GROSSAMOUNT" bigint,
    "NETAMOUNT" double precision,
    "TAXAMOUNT" double precision,
    "ITEMATPSTATUS" character varying ,
    "OPITEMPOS" character varying ,
    "QUANTITY" bigint,
    "QUANTITYUNIT" character varying ,
    "DELIVERYDATE" date
)


CREATE TABLE IF NOT EXISTS salesorders
(
    "SALESORDERID" bigint,
    "CREATEDBY" bigint,
    "CREATEDAT" date,
    "CHANGEDBY" bigint,
    "CHANGEDAT" date,
    "FISCVARIANT" character varying ,
    "FISCALYEARPERIOD" character varying ,
    "NOTEID" character varying ,
    "PARTNERID" character varying ,
    "SALESORG" character varying ,
    "CURRENCY" character varying ,
    "GROSSAMOUNT" double precision,
    "NETAMOUNT" double precision,
    "TAXAMOUNT" double precision,
    "LIFECYCLESTATUS" character varying ,
    "BILLINGSTATUS" character varying ,
    "DELIVERYSTATUS" character varying 
)
;

select * from productcategoriestext;

SELECT * FROM products pr
LEFT JOIN productcategoriestext pt
ON pr."PRODCATEGORYID" = pt."PRODCATEGORYID"
WHERE "SHORT_DESCR" LIKE 'Mountain Bike';

-- Employees Analysis
-- Q9: Find the number of employees for each sex.
select "SEX", COUNT(*) AS "EMPLOYEE_SEX" 
from employees
GROUP BY  "SEX" ;

-- Q10: List the employees who have 'Manager' in their job title.
SELECT * FROM employees;


-- Product Categories Analysis
-- Q11: List all product categories along with their descriptions.
select pc."PRODCATEGORYID", pct."SHORT_DESCR"  from productcategories pc 
left join productcategoriestext pct
on pc."PRODCATEGORYID" = pct."PRODCATEGORYID"


-- Q12: Find all products that belong to the 'Mountain Bike' category.
select pr."PRODUCTID" , pr."PRODCATEGORYID", pct."SHORT_DESCR" from products pr 
left join productcategoriestext pct
on pr."PRODCATEGORYID" = pct."PRODCATEGORYID"
where pct."SHORT_DESCR" = 'Mountain Bike'






