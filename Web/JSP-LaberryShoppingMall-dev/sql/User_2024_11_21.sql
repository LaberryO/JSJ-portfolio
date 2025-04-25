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

create table member(
    userId varchar2(10) not null primary key,
    userPW varchar2(30),
    userName varchar2(10),
    phone varchar2(11),
    addr varchar2(100),
    birthDate date,
    email varchar2(30),
    registerDay varchar2(30)
);

insert into member values ('admin', 'admin1234', '관리자', null, null, null, 'admin@homepage.kr', '20241114');
insert into member values ('test', null, null, null, null, null, null, null);
insert into member values ('test2', 'test', '테스트2', '01022224444', '경기도 수원시 팔달구 매산동', '20241114', 'test@swjb.hs.kr', sysdate);

create table cart(
    productId varchar2(10) not null,
    userId varchar2(10) not null,
    quantity number not null,
    constraint buy foreign key (productId) references product(productId),
    constraint who foreign key (userId) references member(userId)
);

select * from cart;
select * from product;
select * from member;

delete from member where userid != 'test';

INSERT INTO cart (productId, userId, quantity) VALUES ('adsfdsa', 'test', 1);

create view v_cart as select p.productId, productName, unitPrice, c.quantity, unitPrice*c.quantity as subTotal, m.userId from member m join cart c on m.userId=c.userId join product p on p.productId=c.productId;

drop table cart;
drop table member;
drop table product;

select fileName from product;
select * from v_cart;
commit;