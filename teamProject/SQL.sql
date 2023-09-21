create table pjt_shop_member(
    id varchar2(20) not null primary key,
    password char(64) not null,
    session_level number(1) not null,
    name varchar2(10) not null,
    nick varchar2(20) not null,
    email varchar2(100) not null,
    contact varchar2(13),
    addr1 varchar2(100),
    addr2 varchar2(100),
    addr3 varchar2(100),
    reg_date date default SYSDATE,
    login_date date,
    up_date date,
    exit_date date
);

create table pjt_shop_purchase(
    purchase_no char(5) not null primary key,
    buyer_id varchar2(20) references pjt_shop_member(id),
    receiver_name varchar2(10) not null,
    receiver_contact varchar2(13) not null,
    receiver_addr1 varchar2(100) not null,
    receiver_addr2 varchar2(100) not null,
    receiver_addr3 varchar2(100) not null,
    delivery_memo varchar2(200),
    pay_method char(4) not null,
    transfer_name varchar2(10),
    cash_receipt varchar2(20),
    card_number char(19),
    card_cvc char(3)
);

create table pjt_shop_product(
    product_no char(5) not null primary key,
    price number(10) not null,
    name varchar2(80) not null,
    origin_country varchar2(20) not null,
    sell_country varchar2(20) not null,
    reg_date date default sysdate,
    one_sentence varchar2(200),
    description varchar2(4000),
    images varchar2(80),
    stock number(5)
);

create table pjt_shop_basket(
    id varchar2(20) not null references pjt_shop_member(id),
    product_no char(5) not null references pjt_shop_product(product_no),
    count number(5) default 1
);

create table pjt_shop_purchase_detail(
    purchase_no char(5) not null references pjt_shop_purchase(purchase_no),
    product_no char(5) not null references pjt_shop_product(product_no),
    count number(5) default 1
);

create table pjt_shop_faq(
    faq_no char(5) not null primary key,
    question varchar2(200) not null,
    answer varchar2(4000) not null,
    reg_date date default sysdate
);

create table pjt_shop_qna(
    qna_no char(5) not null primary key,
    reg_id varchar2(20) not null references pjt_shop_member(id),
    reg_date date default sysdate,
    title varchar(80) not null,
    content varchar2(4000) not null,
    update_date date,
    reply varchar2(4000),
    reply_date date
);

create table pjt_shop_free(
    free_no char(5) not null primary key,
    reg_id varchar2(20) not null references pjt_shop_member(id),
    reg_date date default sysdate,
    content varchar2(4000),
    reply varchar2(4000),
    depth number(1) default 0,
    step number default 0
);