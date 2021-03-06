CREATE TABLE ORD  (
    ORDID               NUMBER (4) NOT NULL,
    ORDERDATE           DATE,
    COMMPLAN            VARCHAR2(1),
    CUSTID              NUMBER (6) NOT NULL,
    SHIPDATE            DATE,
    TOTAL               NUMBER (8,2) CONSTRAINT TOTAL_ZERO CHECK (TOTAL >= 0),
--    CONSTRAINT ORD_FOREIGN_KEY FOREIGN KEY (CUSTID) REFERENCES CUSTOMER (CUSTID),
    CONSTRAINT ORD_PRIMARY_KEY PRIMARY KEY (ORDID));


CREATE TABLE ITEM (
    ORDID           NUMBER(4) NOT NULL,
    ITEMID          NUMBER(4) NOT NULL,
    PRODID          NUMBER(6),
    ACTUALPRICE     NUMBER(8, 2),
    QTY             NUMBER(8),
    ITEMTOT         NUMBER(8, 2),
    CONSTRAINT ITEM_FOREIGN_KEY FOREIGN KEY (ORDID) REFERENCES ORD (ORDID),
    CONSTRAINT ITEM_PRIMARY_KEY PRIMARY KEY (ORDID, ITEMID)
);


create table child (
    parent_id number,
    text varchar2(23)
);


alter table item drop constraint ITEM_FOREIGN_KEY <caret>