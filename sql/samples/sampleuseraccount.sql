-- ���[�U�[�A�J�E���g�̍쐬
insert into useraccount (id, name)
    values (UNHEX(REPLACE(UUID() ,'-', '')), "testA");

-- ���[�U�[�A�J�E���g�̊m�F

select HEX(id), name from useraccount;

-- �p�X���[�h�̑}��
insert into password (id, userid, password) 
values ( 
	UNHEX(REPLACE(UUID() ,'-', '')),
	(select id from useraccount where name = 'testA'), 
	MD5('passpass')
)
-- �p�X���[�h�̊m�F
select HEX(id), HEX(userid), password from password;

set @username = 'testA';

select useraccount.name, password.password
from useraccount, password
where useraccount.id = password.userid and
      useraccount.name = @username
