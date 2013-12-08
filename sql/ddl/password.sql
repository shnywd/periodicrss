create table password (
	id binary(16) primary key,
	userid binary(16),
	password varchar(32),
	foreign key (userid)
		references useraccount(id)
)