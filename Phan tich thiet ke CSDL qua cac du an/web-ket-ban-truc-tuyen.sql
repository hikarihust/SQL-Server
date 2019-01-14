insert into Users values(NEWID(), 'vudinhquang', '123456');
insert into Profiles values('D0EB2E50-A4A8-45F0-8D1D-90A5774A819D', 'Vu Dinh Quang');
select * from Profiles;

insert into Users values(NEWID(), 'vudinhquang1', '123456');
insert into Profiles values('4669BEA8-ABF1-407D-8EF8-C5C4FAA8D7EE', 'Vu Dinh Quang 1');

select * from Users;

insert into Inboxs values('D0EB2E50-A4A8-45F0-8D1D-90A5774A819D', '4669BEA8-ABF1-407D-8EF8-C5C4FAA8D7EE', 'test');

select * from Inboxs;