use e_commerce;
-- Q1
SELECT * 
FROM customers 
WHERE EXTRACT(YEAR FROM join_date) = 2024; 

-- Q2
SELECT DISTINCT category 
FROM products;

-- Q3
SELECT COUNT(*) AS total_orders 
FROM orders;

-- Q4
SELECT category, ROUND(AVG(price), 2) AS avg_price
FROM products
GROUP BY category;

-- Q5
SELECT * 
FROM orders 
WHERE total_amount > 150.00;

-- Q6
SELECT p.*
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.order_item_id IS NULL;

-- Q7
SELECT c.customer_id, c.first_name, c.last_name, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC
LIMIT 5;

-- Q8
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month_year, 
    SUM(total_amount) AS monthly_revenue 
FROM orders 
GROUP BY DATE_FORMAT(order_date, '%Y-%m') 
ORDER BY month_year;

-- Q9
SELECT p.product_name, SUM(oi.quantity) AS total_quantity_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity_sold DESC
LIMIT 1;

-- Q10
SELECT c.customer_id, c.first_name, c.last_name, COUNT(o.order_id) AS order_count
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(o.order_id) > 3;

-- Q11
SELECT c.customer_id, c.first_name, c.last_name, ROUND(AVG(o.total_amount), 2) AS avg_order_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- Q12
SELECT oi.order_id, COUNT(DISTINCT p.category) AS category_count
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY oi.order_id
HAVING COUNT(DISTINCT p.category) > 2;

-- Q13
SELECT order_date, SUM(total_amount) AS daily_revenue
FROM orders
GROUP BY order_date
ORDER BY daily_revenue DESC
LIMIT 1;

-- Q14
WITH RankedProducts AS (
    SELECT product_id, product_name, category, price,
           DENSE_RANK() OVER (PARTITION BY category ORDER BY price DESC) as rnk
    FROM products
)
SELECT category, product_name, price
FROM RankedProducts
WHERE rnk = 2;

-- Q15
WITH MonthlySales AS (
    SELECT 
        DATE_FORMAT(order_date, '%Y-%m-01') AS order_month,
        SUM(total_amount) AS current_revenue
    FROM orders
    GROUP BY DATE_FORMAT(order_date, '%Y-%m-01')
)
SELECT 
    DATE_FORMAT(order_month, '%Y-%m') AS month,
    current_revenue,
    LAG(current_revenue) OVER (ORDER BY order_month) AS previous_revenue,
    ROUND(
        (current_revenue - LAG(current_revenue) OVER (ORDER BY order_month)) 
        / LAG(current_revenue) OVER (ORDER BY order_month) * 100, 2
    ) AS mom_growth_percentage
FROM MonthlySales;

-- Q16
WITH MaxDate AS (     
    SELECT MAX(order_date) AS max_order_date FROM orders 
) 
SELECT 
    c.customer_id, 
    c.first_name, 
    c.last_name, 
    MAX(o.order_date) AS last_order_date 
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id 
CROSS JOIN MaxDate m 
GROUP BY c.customer_id, c.first_name, c.last_name, m.max_order_date 
HAVING MAX(o.order_date) < m.max_order_date - INTERVAL 90 DAY;

-- Q17
SELECT order_id, order_date, total_amount,
       SUM(total_amount) OVER (ORDER BY order_date, order_id) AS running_total
FROM orders;

-- Q18
WITH CategorySpending AS (
    SELECT o.customer_id, p.category, SUM(oi.quantity * oi.unit_price) AS total_spent
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY o.customer_id, p.category
)
SELECT c.first_name, c.last_name, cs.category, cs.total_spent,
       DENSE_RANK() OVER (PARTITION BY cs.category ORDER BY cs.total_spent DESC) AS category_rank
FROM CategorySpending cs
JOIN customers c ON cs.customer_id = c.customer_id;

-- Q19
WITH TotalRevenue AS (
    SELECT SUM(total_amount) AS grand_total FROM orders
)
SELECT p.product_name,
       SUM(oi.quantity * oi.unit_price) AS product_revenue,
       ROUND(
           (SUM(oi.quantity * oi.unit_price) / tr.grand_total) * 100, 2
       ) AS revenue_contribution_pct
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
CROSS JOIN TotalRevenue tr
GROUP BY p.product_id, p.product_name, tr.grand_total
ORDER BY revenue_contribution_pct DESC;
-- Q20
WITH TotalRevenue AS (
    SELECT SUM(total_amount) AS grand_total FROM orders
)
SELECT p.product_name,
       SUM(oi.quantity * oi.unit_price) AS product_revenue,
       ROUND(
           (SUM(oi.quantity * oi.unit_price) / tr.grand_total) * 100, 2
       ) AS revenue_contribution_pct
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
CROSS JOIN TotalRevenue tr
GROUP BY p.product_id, p.product_name, tr.grand_total
ORDER BY revenue_contribution_pct DESC;

