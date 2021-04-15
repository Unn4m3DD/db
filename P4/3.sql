create schema class_4_ex_3;

create table class_4_ex_3.Warehouse(
  id INT primary key,
  location VARCHAR(50) not null,
);

create table class_4_ex_3.Supplier(
  nif CHAR(9) primary key,
  address VARCHAR(50) not null,
  fax_number CHAR(14)
  /* len(00351) + 9 */
  not null,
  payment_options VARCHAR(10) not null check (payment_options in ("paypal", "mbway")),
  name VARCHAR(30) not null,
);

create table class_4_ex_3.Order(
  id INT primary key,
  timestamp BIGINT not null,
  supplier_nif CHAR(9) not null foreign key references class_4_ex_3.Supplier(nif)
);

create table class_4_ex_3.Registred(
  internal_code INT primary key,
  supplier_nif CHAR(9) not null foreign key references class_4_ex_3.Supplier(nif),
  warehouse_id INT not null foreign key references class_4_ex_3.Warehouse(id)
);

create table class_4_ex_3.Product(
  id INT primary key,
  warehouse_id INT not null primary key foreign key references class_4_ex_3.Warehouse(id),
  VAT INT not null check (VAT in (13, 23)),
  name VARCHAR(30),
);

create table class_4_ex_3.Contains(
  product_id INT primary key foreign key references class_4_ex_3.Product(id),
  order_id INT primary key foreign key references class_4_ex_3.Order(id),
  price REAL not null,
  amount INT not null,
);