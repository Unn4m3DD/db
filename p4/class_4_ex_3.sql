create schema class_4_ex_3;
GO
;

create table class_4_ex_3.Warehouse(
  id INT primary key,
  location VARCHAR(50) not null,
)
GO
;

create table class_4_ex_3.Supplier(
  nif CHAR(9) primary key,
  address VARCHAR(50) not null,
  fax_number CHAR(14)  not null, --len(00351) + 9
  payment_options VARCHAR(10) not null check (payment_options in ('paypal', 'mbway')),
  name VARCHAR(30) not null,
)
GO
;

create table class_4_ex_3.[Order](
  id INT primary key,
  timestamp BIGINT not null,
  supplier_nif CHAR(9) not null foreign key references class_4_ex_3.Supplier(nif)
)
GO
;

create table class_4_ex_3.Registred(
  internal_code INT primary key,
  supplier_nif CHAR(9) not null foreign key references class_4_ex_3.Supplier(nif),
  warehouse_id INT not null foreign key references class_4_ex_3.Warehouse(id)
)
GO
;

create table class_4_ex_3.Product(
  id INT not null,
  warehouse_id INT not null foreign key references class_4_ex_3.Warehouse(id),
  VAT INT not null check (VAT in (13, 23)),
  name VARCHAR(30) not null,
  primary key (id, warehouse_id)
)
GO
;

create table class_4_ex_3.[Contains](
  product_id INT ,
  product_warehouse_id INT ,
  order_id INT foreign key references class_4_ex_3.[Order](id),
  price REAL not null,
  amount INT not null,
  foreign key (product_id, product_warehouse_id) references class_4_ex_3.Product(id, warehouse_id),
  primary key (product_id, product_warehouse_id, order_id),
)
GO
;