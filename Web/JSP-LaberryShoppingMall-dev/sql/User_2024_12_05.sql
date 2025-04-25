create table product(
    productId number generated always as identity primary key, -- always = 명시적으로 값을 넣지 않아야함, 2024-12-05 변경됨.
    productName varchar2(30),
    unitPrice number,
    description varchar2(100),
    category varchar2(20),
    condition varchar2(20),
    fileName varchar2(100),
    quantity number
);

create table cart(
    productId number not null,
    userId varchar2(10) not null,
    quantity number not null,
    constraint buy foreign key (productId) references product(productId),
    constraint who foreign key (userId) references member(userId)
);

create table member(
    userId varchar2(20) not null primary key, -- 2024-12-05 변경됨.
    userPW varchar2(30),
    userName varchar2(10),
    phone varchar2(11),
    addr varchar2(100),
    birthDate date,
    email varchar2(30),
    registerDay varchar2(30)
);

alter table member modify (userId varchar2(20)); -- 2024-12-05 변경됨.
alter table product modify (productId varchar2(20)); -- 2024-12-04 변경됨.
alter table cart modify (productId varchar2(20)); -- 2024-12-04 변경됨.

insert into member values ('admin', 'admin1234', '관리자', null, null, null, 'admin@homepage.kr', '20241114');
insert into product (productName, unitPrice, description, category, condition, fileName, quantity) values ('라베리', 50000, '라베리입니다.', '개발자', 'New','01_laberry.png', 0);

select productId from product order by unitPrice asc fetch first 1 rows only;

select * from cart;
select * from product;
select * from member;   
select userId, userPW from member where userId='admin';

delete from member where userid != 'test';

INSERT INTO cart (productId, userId, quantity) VALUES ('test', 1);

create view v_cart as select p.productId, productName, unitPrice, c.quantity, unitPrice*c.quantity as subTotal, m.userId from member m join cart c on m.userId=c.userId join product p on p.productId=c.productId;

drop table cart;
drop table member;
drop table product;

select fileName from product;
select * from v_cart;
commit;