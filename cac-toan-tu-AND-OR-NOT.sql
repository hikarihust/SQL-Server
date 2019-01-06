use HUST

select * from Customers;

--AND
select * from Customers where Country = 'Germany' AND City = 'Berlin';

--OR
select * from Customers 
where City = 'Berlin' OR City = 'London';

--NOT
select * from Customers 
where NOT Country = 'Germany';

--combine AND, OR va NOT
INSERT INTO Customers values(6, 'Berglunds snabbkop', 'Christina Berglund', 'Berguvsvagen 8', 'Munich', ' S-958 22', 'Germany');
select * from Customers
where Country = 'Germany' AND (City = 'Berlin' OR City = 'Munich');

select * from Customers
where NOT Country = 'Germany' AND Not Country = 'Mexico'; 