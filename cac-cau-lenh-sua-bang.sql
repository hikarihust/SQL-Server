--them cot
alter table Student
add Address nvarchar(50);

--them nhieu cot
alter table Student
add Province nvarchar(50), District nvarchar(50);

--sua kieu du lieu cua 1 field sang kieu du lieu khac
alter table Student 
alter column Address nvarchar(250);

--xoa column
alter table Student
drop column Address

--doi ten truong
sp_rename 'Student.Province', 'Province1', 'COLUMN';