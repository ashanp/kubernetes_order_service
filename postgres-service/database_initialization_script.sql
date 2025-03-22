-- Create the database
CREATE DATABASE product;

-- Create a user with a password
CREATE USER productuser WITH ENCRYPTED PASSWORD 'myproduct';

-- Grant all privileges on the database to the user
GRANT ALL PRIVILEGES ON DATABASE product TO productuser;

-- Connect to the newly created database
\c productuser;

-- Grant privileges to the user inside the database
GRANT ALL ON SCHEMA public TO productuser;

-- Create a table
CREATE TABLE product (
    id BIGSERIAL PRIMARY KEY,  -- Auto-incrementing ID
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    price DOUBLE PRECISION NOT NULL
);

-- when creating Auto-incrementing automatically a sequence gets created at the time of table creation
GRANT ALL PRIVILEGES ON SEQUENCE product_id_seq TO public;

-- Grant all privileges on the table to the user
GRANT ALL PRIVILEGES ON TABLE product TO productuser;

-- Insert a sample record
INSERT INTO product (name, description, price) VALUES ('Laptop', 'High-performance laptop', 1200.00);
INSERT INTO product (name, description, price) VALUES ('Smartphone', 'Latest smartphone model', 800.00);
INSERT INTO product (name, description, price) VALUES ('Tablet', 'Portable tablet for reading and browsing', 350.00);
INSERT INTO product (name, description, price) VALUES ('Headphones', 'Noise-cancelling headphones', 200.00);
INSERT INTO product (name, description, price) VALUES ('Keyboard', 'Ergonomic wireless keyboard', 80.00);
INSERT INTO product (name, description, price) VALUES ('Mouse', 'Wireless optical mouse', 30.00);
INSERT INTO product (name, description, price) VALUES ('Monitor', '27-inch 4K monitor', 450.00);
INSERT INTO product (name, description, price) VALUES ('Printer', 'Wireless inkjet printer', 150.00);
INSERT INTO product (name, description, price) VALUES ('External Hard Drive', '1TB external hard drive', 70.00);
INSERT INTO product (name, description, price) VALUES ('Webcam', 'High-definition webcam', 60.00);

-- Create the database
CREATE DATABASE inventory;

-- Create a user with a password
CREATE USER inventoryuser WITH ENCRYPTED PASSWORD 'myinventory';

-- Grant all privileges on the database to the user
GRANT ALL PRIVILEGES ON DATABASE inventoryuser TO myuser;

-- Connect to the newly created database
\c inventoryuser;

-- Grant privileges to the user inside the database
GRANT ALL ON SCHEMA public TO inventoryuser;

-- Create a table
CREATE TABLE inventory (
    id BIGSERIAL PRIMARY KEY, -- Auto-incrementing ID
    quantity INT
);

-- when creating Auto-incrementing automatically a sequence gets created at the time of table creation
GRANT ALL PRIVILEGES ON SEQUENCE inventory_id_seq TO public;

-- Grant all privileges on the table to the user
GRANT ALL PRIVILEGES ON TABLE inventory TO inventoryuser;

-- Insert a sample record
INSERT INTO inventory (id, quantity) VALUES (1, 100);
INSERT INTO inventory (id, quantity) VALUES (2, 50);
INSERT INTO inventory (id, quantity) VALUES (3, 200);
INSERT INTO inventory (id, quantity) VALUES (4, 75);
INSERT INTO inventory (id, quantity) VALUES (5, 150);
INSERT INTO inventory (id, quantity) VALUES (6, 30);
INSERT INTO inventory (id, quantity) VALUES (7, 120);
INSERT INTO inventory (id, quantity) VALUES (8, 90);
INSERT INTO inventory (id, quantity) VALUES (9, 60);
INSERT INTO inventory (id, quantity) VALUES (10, 180);

-- Create the database
CREATE DATABASE orders;

-- Create a user with a password
CREATE USER ordersuser WITH ENCRYPTED PASSWORD 'myorders';

-- Grant all privileges on the database to the user
GRANT ALL PRIVILEGES ON DATABASE orders TO ordersuser;

-- Connect to the newly created database
\c ordersuser;

-- Grant privileges to the user inside the database
GRANT ALL ON SCHEMA public TO ordersuser;

-- Create a table
CREATE TABLE orders (
    id BIGSERIAL PRIMARY KEY, -- Auto-incrementing ID
    product_id BIGINT,
    quantity INT,
    total_price DOUBLE PRECISION  NOT NULL
);

-- when creating Auto-incrementing automatically a sequence gets created at the time of table creation
GRANT ALL PRIVILEGES ON SEQUENCE orders_id_seq TO public;

-- Grant all privileges on the table to the user
GRANT ALL PRIVILEGES ON TABLE orders TO ordersuser;

-- Insert a sample record
INSERT INTO orders (product_id, quantity, total_price) VALUES (1, 2, 2400.00);
INSERT INTO orders (product_id, quantity, total_price) VALUES (2, 1, 800.00);
INSERT INTO orders (product_id, quantity, total_price) VALUES (3, 3, 1050.00);
INSERT INTO orders (product_id, quantity, total_price) VALUES (4, 1, 200.00);
INSERT INTO orders (product_id, quantity, total_price) VALUES (5, 2, 160.00);
INSERT INTO orders (product_id, quantity, total_price) VALUES (6, 1, 30.00);
INSERT INTO orders (product_id, quantity, total_price) VALUES (7, 1, 450.00);
INSERT INTO orders (product_id, quantity, total_price) VALUES (8, 2, 300.00);