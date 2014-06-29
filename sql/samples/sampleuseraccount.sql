-- ユーザーアカウントの作成
insert into useraccount (id, name)
    values (UNHEX(REPLACE(UUID() ,'-', '')), "testA");

-- ユーザーアカウントの確認

select HEX(id), name from useraccount;

-- パスワードの挿入
insert into password (id, userid, password) 
values ( 
	UNHEX(REPLACE(UUID() ,'-', '')),
	(select id from useraccount where name = 'testA'), 
	MD5('passpass')
)
-- パスワードの確認
select HEX(id), HEX(userid), password from password;

set @username = 'testA';

select useraccount.name, password.password
from useraccount, password
where useraccount.id = password.userid and
      useraccount.name = @username

-------
