/*1. List the clients with credit cards and order the result by “rut” 
ascending.*/

SELECT C.* FROM Customers C
INNER JOIN Accounts A ON C.id = A.customer_id
WHERE A.type = 'credit_card'
ORDER BY C.rut ASC;

/*2. List rut, concatenate first name and last name and name it as "full_name" 
from clients who have products in the city "Melipeuco"*/

SELECT C.rut, CONCAT(CONCAT(C.first_name, ' '), C.last_name) AS full_name 
FROM Customers C
INNER JOIN Accounts A ON C.id = A.customer_id
INNER JOIN Locations L ON A.location_id = L.id
WHERE L.city = 'Melipeuco';

/*3. Say what is the city where the manager is "Cruz Norton"*/

SELECT city FROM Locations
WHERE CONCAT(CONCAT(manager_first_name, ' '),manager_last_name) = 'Cruz Norton';

/*4. List the id, aperture date and type of product of accounts 
which the owner are "Nora"*/

SELECT A.id, A.aperture_date, A.type FROM Accounts A
INNER JOIN Customers C ON A.customer_id = C.id
WHERE C.first_name = 'Nora';
 
/*5. The board of directors is requesting know the locations, accounts numbers 
and balances which are loans with balance greater than 90000 
and were issued in 2011*/

SELECT L.city, A.id, A.balance FROM Accounts A
INNER JOIN Locations L ON A.location_id = L.id
WHERE A.type = 'loan' AND A.balance > 90000 
AND EXTRACT(year FROM A.aperture_date) = 2011;

/*6. Find out the highest accounts' balances*/

SELECT A.* FROM Accounts A
WHERE A.balance = (SELECT MAX(balance) FROM Accounts);

/*7. Give the name and last name of the account which has the balance found in the previous
bullet.*/

SELECT C.first_name, C.last_name FROM Accounts A
INNER JOIN Customers C ON A.customer_id = C.id
WHERE A.balance = (SELECT MAX(balance) FROM Accounts);

/*8. List the locations which issued loans in the year 2015*/

SELECT L.* FROM Accounts A
INNER JOIN Locations L ON A.location_id = L.id
WHERE A.type = 'loan' AND EXTRACT(year FROM A.aperture_date) = 2015;

/*9. Find out the clients who have not credit cards in the city "Hulshout"*/

SELECT C.* FROM Customers C
INNER JOIN Accounts A ON C.id = A.customer_id
INNER JOIN Locations L ON A.location_id = L.id
WHERE A.type <> 'credit_card' AND L.city = 'Hulshout';

/*10.Find out the lowest loan's balance among all locations*/

SELECT A.* FROM Accounts A
WHERE A.type = 'loan'
AND A.balance = (SELECT MIN(balance) FROM Accounts WHERE type = A.type);