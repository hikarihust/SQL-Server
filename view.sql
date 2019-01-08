use HUST;

--tao bang Students moi
create table Students(
	StudentId int primary key,
	Name nvarchar(50),
	Age int,
	DateOfBirth datetime,
	Gender bit,
	Province nvarchar(50),
	District nvarchar(50)
);

insert into Students(StudentId, Name, Age, DateOfBirth, Gender)
values(1, 'Nguyen Van A', 20, '1990-08-20', 1),
(2, 'Nguyen Van B', 19, '1990-08-20', 1),
(3, 'Nguyen Van C', 21, '1990-08-20', 1);

--tao view
create view v_Student_AgeGreaterThan18
as
select * from Students
where Age > 20;
--dung view, co the dung chung dung lai dc nhiu lan ma ko can phai viet lai phan cau query trong view
select * from v_Student_AgeGreaterThan18;

-----------------------------------------------------------------------------------------------

--tao view voi check option 
alter view v_Student_AgeGreaterThan18
as
select * from Students
where Age is not null
with check option;  --khi them sua xoa du lieu truc tiep qua view thi cac dieu kien nay se dc kiem tra
select * from v_Student_AgeGreaterThan18;

--tat ca cac truong not null trong bang thi phai dc include trong view

--khi update du lieu thi view se dc update du lieu va day vao bang that
update v_Student_AgeGreaterThan18
set Province = 'Ha Noi', District = 'Cau Giay'
where StudentId = 1;

--khi them du lieu thi view se nhan du lieu va day vao bang that
insert into v_Student_AgeGreaterThan18
values(4, 'Nguyen Van D', 22, '1992-03-01', 1, 'Hanoi', 'Cau Giay');

--delete
delete from v_Student_AgeGreaterThan18 where StudentId = 4;

select * from v_Student_AgeGreaterThan18;
select * from Students;