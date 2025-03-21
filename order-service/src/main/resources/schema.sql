-- src/main/resources/schema.sql (order-service)
CREATE TABLE orders (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    product_id BIGINT,
    quantity INT,
    total_price DOUBLE
);