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

INSERT INTO product VALUES ('scs', '신창섭', 891214, '정상화의 신입니다', '신', '중고품', '01_scs', 1);