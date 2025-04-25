create table product(
    productId varchar2(10) not null primary key,
    productName varchar2(30),
    unitPrice number,
    description varchar2(100),
    category varchar2(20),
    condition varchar2(20),
    fileName varchar2(100),
    quantity number
);
desc product;
drop table product;
select * from product;
commit;

delete from product where productid='scs';

INSERT INTO product VALUES ('scs', '신창섭', 891214, '정상화의 신입니다', '신', '중고품', '01_scs.png', 1);

drop table member;

create table member(
    userId varchar2(10) not null primary key,
    userPW varchar2(30),
    userName varchar2(10),
    phone varchar2(8),
    addr varchar2(100),
    birthDate date,
    email varchar2(30),
    registerDay varchar2(30)
);

alter table member modify (registerDay date);
alter table member modify (phone varchar2(11));

insert into member values ('admin', 'admin1234', '관리자', null, null, null, 'admin@homepage.kr', '20241114');
insert into member values ('test', null, null, null, null, null, null, null);
insert into member values ('test2', 'test', '테스트2', '01022224444', '경기도 수원시 팔달구 매산동', '20241114', 'test@swjb.hs.kr', sysdate);

select * from member;
commit;

update member set userName='테스트' where userId='test';
update member set registerDay=trunc(sysdate) where userId='admin';
select * from test;
drop table user1;
create table cart(
    productId varchar2(10) not null,
    userId varchar2(10) not null,
    quantity number not null,
    constraint buy foreign key (productId) references product(productId),
    constraint who foreign key (userId) references member(userId)
);
select * from user1;

drop table test;
select * from cart;

drop view v_cart;

create view v_cart as select p.productId, productName, unitPrice, c.quantity, unitPrice*c.quantity as subTotal, m.userId from member m join cart c on m.userId=c.userId join product p on p.productId=c.productId;
select * from v_cart where userId='test';
commit;