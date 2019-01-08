create table t1 (id int primary key, t1_value varchar(50))

insert into t1 select 1, 'value1'
insert into t1 select 2, 'value2'
insert into t1 select 3, 'value3'

create table t2 (id int primary key, t2_value varchar(50))
insert into t2 select 1, NULL
insert into t2 select 2, NULL
insert into t2 select 3, NULL

select * from t1
select * from t2

--tao 1 trigger khi ma update bang t1 thi no se tu dong update gia tri vua update vao bang t2 theo Id ma ta truyen vao
create trigger update_t2
on t1 for update
as
begin
	set nocount on
	declare @id int, @t1_value varchar(50)				 
	select @id = id, @t1_value = t1_value from inserted  --luu gia duoc insert vao bang t1 vao bang t2-> hanh dong sau khi insert
														 -- nguoc lai voi INSERTED la DELETED
	update t2 set t2_value = @t1_value
	where id = @id
end
--run trigger
--update 1 dong cua bang t1
update t1 set t1_value = 'Sample' where id = 1; ->update gia tri 'Sample' vao bang t2 voi id = 1
--update nhieu dong cua bang t1
update t1 set t1_value = 'Sample';   --bang t2 van chi duoc update 1 ban ghi



--update duoc nhiu ban ghi cua bang t2 cung 1 luc -> update ket hop voi inner join
alter trigger update_t2
on t1 for update
as
begin
	set nocount on
	update t2 set t2.t2_value = i.t1_value
		from inserted as i
		inner join t2 on t2.id = i.id
end

update t1 set t1_value = 'Sample';   --tat cac cac row trong t2 cung dc update theo
select * from t2;


------------------------------------------------------------------------------------

--moi lan them vao 1 Order thi tu dong tao them 1 ban ghi vao bang tblOrdersAudit de log lai xem ban ghi nay duoc tao ra khi nao
	--va ai la nguoi tao
create table tblOrders
(
  OrderID integer Identity(1,1) primary key,
  OrderApprovalDateTime datetime,
  OrderStatus varchar(20)
)

create table tblOrdersAudit
(
  OrderAuditID integer Identity(1,1) primary key,
  OrderID integer,
  OrderApprovalDateTime datetime,
  OrderStatus varchar(20),
  UpdatedBy nvarchar(128),
  UpdatedOn datetime
)

--tao trigger
create trigger trig_CreateOrderAudit on tblOrders
after update, insert
as
begin
	insert into tblOrdersAudit(OrderID, OrderApprovalDateTime, OrderStatus, UpdatedBy, UpdatedOn)
	select i.OrderID, i.OrderApprovalDateTime, i.OrderStatus, SUSER_NAME(), GETDATE()
	from tblOrders t inner join inserted i on t.OrderID = i.OrderID
end

insert into tblOrders values (NULL, 'Pending')
insert into tblOrders values (NULL, 'Pending')
insert into tblOrders values (NULL, 'Pending')

select * from tblOrders;
select * from tblOrdersAudit;

update tblOrders
set OrderStatus = 'Approved', OrderApprovalDateTime = GETDATE()
where OrderID = 1;