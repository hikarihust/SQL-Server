select * from Products;
--update nhieu cot
update Products set Price = 17
where ProductId = 1;  --neu ko co where thi tat ca cac row deu bi update

--update nhieu cot
update Products set Price = 17, CategoryId = 2, ProductName = 'Chais 1'
where ProductId = 1;