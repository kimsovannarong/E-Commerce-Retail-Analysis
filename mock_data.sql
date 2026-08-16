use e_commerce;
-- Insert Sample Data into Customers
INSERT INTO customers (customer_id, first_name, last_name, email, join_date) VALUES
(1, 'Sophea', 'Chan', 'sophea.chan@example.com', '2024-01-15'),
(2, 'Vireak', 'Seng', 'vireak.seng@example.com', '2024-02-10'),
(3, 'Dara', 'Rath', 'dara.rath@example.com', '2023-11-05'),
(4, 'Bora', 'Kim', 'bora.kim@example.com', '2024-03-01'),
(5, 'Srey', 'Neth', 'srey.neth@example.com', '2023-05-20'),
(6, 'Kosal', 'Mony', 'kosal.mony@example.com', '2024-04-12');

-- Insert Sample Data into Products
INSERT INTO products (product_id, product_name, category, price) VALUES
(101, 'Wireless Mouse', 'Electronics', 25.00),
(102, 'Mechanical Keyboard', 'Electronics', 85.00),
(103, 'Gaming Monitor', 'Electronics', 250.00),
(104, 'Cotton T-Shirt', 'Apparel', 15.00),
(105, 'Denim Jeans', 'Apparel', 45.00),
(106, 'Running Shoes', 'Footwear', 110.00),
(107, 'Coffee Mug', 'Home', 12.00),
(108, 'Desk Lamp', 'Home', 35.00);

-- Insert Sample Data into Orders
INSERT INTO orders (order_id, customer_id, order_date, total_amount) VALUES
(1001, 1, '2024-01-20', 110.00),
(1002, 2, '2024-02-15', 250.00),
(1003, 1, '2024-03-10', 100.00),
(1004, 3, '2023-12-01', 45.00),
(1005, 4, '2024-03-15', 335.00),
(1006, 1, '2024-04-02', 25.00),
(1007, 2, '2024-04-10', 60.00),
(1008, 1, '2024-05-01', 170.00);

-- Insert Sample Data into Order Items
INSERT INTO order_items (order_item_id, order_id, product_id, quantity, unit_price) VALUES
(1, 1001, 101, 1, 25.00),
(2, 1001, 102, 1, 85.00),
(3, 1002, 103, 1, 250.00),
(4, 1003, 104, 2, 15.00),
(5, 1003, 105, 1, 45.00),
(6, 1003, 101, 1, 25.00),
(7, 1004, 105, 1, 45.00),
(8, 1005, 102, 1, 85.00),
(9, 1005, 103, 1, 250.00),
(10, 1006, 101, 1, 25.00),
(11, 1007, 104, 1, 15.00),
(12, 1007, 105, 1, 45.00),
(13, 1008, 106, 1, 110.00),
(14, 1008, 108, 1, 35.00),
(15, 1008, 101, 1, 25.00);