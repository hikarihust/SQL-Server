select * from Products;

select * from Products where Unit  is NULL;

-- Khong the ap dung cac toan tu so sanh =, <, > hoac <> ma phai ap dung cac toan toan tu is Null hoac la is not Null 
select * from Products where NOT Unit  is NULL;
select * from Products where Unit  is not NULL;