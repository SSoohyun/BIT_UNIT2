select * from Members;
select * from Items;
select * from comments;
CREATE TABLE Members (
    userId VARCHAR(40) PRIMARY KEY,
    userPwd VARCHAR(40),
    userName VARCHAR(40),
    address VARCHAR(100),
    phoneNo VARCHAR(40),
    email VARCHAR(40)
);
drop table items;

select * from items;
CREATE TABLE Items (
    itemNo INT AUTO_INCREMENT PRIMARY KEY,
    itemName VARCHAR(40),
    itemPrice INT,
    hit INT default 0,
    category VARCHAR(40),
    detail VARCHAR(8000),
    fileName VARCHAR(40),
    location VARCHAR(40) DEFAULT NULL,
    tel VARCHAR(40) DEFAULT NULL,
    hours VARCHAR(40) DEFAULT NULL
);

Create table Comments(
comNo INT AUTO_INCREMENT PRIMARY KEY,
itemNo int,
userId varchar(40),
content varchar(8000),
regdate datetime default now());
drop table comments;
select host,user,plugin,authentication_string from mysql.user;







insert into items(itemname, itemprice, category, detail, filename) values('멋진 강아지 장난감', 12000, '쇼핑몰', '강아지/장난감', 'toy.jpg');
insert into items(itemname, itemprice, category, detail, filename) values('완전 맛있는 강아지 간식', 10000, '쇼핑몰', '강아지/간식', 'snack.jpg');
insert into items(itemname, itemprice, category, detail, filename) values('[초특가] 강아지 사료 특대', 50000, '쇼핑몰', '강아지/사료', 'meal.jpg');

insert into members values('123', '123', '123', '123', '123', '123');
insert into members values('456', '456', '456', '456', '456', '456');
insert into members values('aaa', 'aaa', 'aaa', 'aaa', 'aaa', 'aaa');

drop table cart;
create table cart(
userId varchar(40),
itemNo int,
quantity int default 1,
primary key(userId, itemNo),
foreign key(userId) references members(userId) on delete cascade,
foreign key(itemNo) references items(itemNo) on delete cascade
);
desc cart;

insert into cart values('123', 1, 1);
insert into cart values('123', 2, 1);
insert into cart(userId, itemNo) values('aaa', 1);
update cart set quantity = 2 where userId = '123' and itemNo = 1;

select * from cart;
select * from items;

-- join
select filename, items.itemname, itemprice, quantity, itemprice*quantity
from cart left join items
on cart.itemno = items.itemno
where userid = '123';


