Create Database DemoWeb
go
use DemoWeb
go
create table NguoiDung (
	id_User int identity (1,1) primary key not null,
	username varchar(100) not null,
	pass varchar(100) not null,
	email varchar(100),
)
go
insert into NguoiDung(username,pass,email) values ('abcdf','123','lephuonghoangx4@gmail.com')
go
/*select * from NguoiDung*/
go
create trigger trInsertUser on NguoiDung
instead of insert
as begin
	declare @username varchar(50)
	select @username = username from inserted
	if @username in (select username from NguoiDung)
		begin
			print 'username da ton tai'
			rollback transaction
		end
	else
		begin
			insert into NguoiDung(username,pass,email) Select username,pass,email from inserted
		end
end
go
/*drop trigger trInsertUser
go*/