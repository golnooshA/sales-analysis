----------- CREATE TABLE -----------

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
    row_id        integer,
    order_id      text,
    order_date    date,
    ship_date     date,
    ship_mode     text,
    customer_id   text,
    customer_name text,
    segment       text,
    country       text,
    city          text,
    state         text,
    postal_code   text,
    region        text,
    product_id    text,
    category      text,
    sub_category  text,
    product_name  text,
    sales         numeric(12,2),
    quantity      integer,
    discount      numeric(5,2),
    profit        numeric(12,2)
);


-------- IMPORT .CSV FILE --------
COPY orders
FROM 'C:/Program Files/Data Analysis/Sales Analysis/superstore.csv'
WITH (FORMAT csv, HEADER, DELIMITER ',', QUOTE '"', ENCODING 'WIN1252');