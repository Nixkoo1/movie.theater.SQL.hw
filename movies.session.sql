CREATE TABLE customer (
    customer_id SERIAL primary key,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    address VARCHAR(150),
    billing_info VARCHAR(150)
);

CREATE TABLE inventory (
    upc SERIAL primary key,
    product_amount INTEGER
);

CREATE TABLE movies (
    movie_id SERIAL primary key,
    movie_name VARCHAR(200),
    time_id TIME,
    date_id DATE
);

CREATE TABLE product (
    item_id SERIAL primary key,
    product_name VARCHAR(100),
    amount INTEGER,
    upc INTEGER not null,
    foreign key(upc) references inventory(upc)
);

CREATE TABLE tickets (
    ticket_id SERIAL primary key,
    theater_id INTEGER,
    customer_id INTEGER not null,
    foreign key(customer_id) references customer(customer_id),
    movie_id INTEGER not null,
    foreign key(movie_id) references movies(movies_id)
);

CREATE TABLE concession (
    concession_order_id SERIAL primary key,
    order_time TIME,
    order_date DATE default CURRENT_DATE,
    total_cost INTEGER,
    customer_id INTEGER not null,
    foreign key(customer_id) references customer(customer_id),
    item_id INTEGER not null
    foreign key(item_id) references production(item_id)
);