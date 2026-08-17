# SQL Challenge 01 : E-Commerce & Retail Analysis

## 📌 Overview
This project focuses on relational database modeling and SQL analysis for an online retail business. You'll analyze customer behavior, sales trends, order items, product category performance, and customer retention.

## 🗄️ Database Schema
- **`customers`**: Stores profile information and join dates.
- **`products`**: Product details, categories, and unit prices.
- **`orders`**: Transaction-level details including total purchase amounts.
- **`order_items`**: Line-item level details mapping products to specific orders.

---

## 🎯 Challenges (20 Questions)
1. **Retrieve all details** of customers who joined in 2024.
2. **List all unique product categories** available in the store.
3. **Count the total number of orders** placed in the database.
4. **Calculate the average price** of products in each category.
5. **Retrieve all orders** where the `total_amount` exceeds $150.00.
6. **Find all products** that have never been ordered.
7. **Top Spenders**: Find the top 5 customers who spent the most overall.
8. **Monthly Revenue**: Calculate total sales revenue generated per month (`YYYY-MM`).
9. **Best Seller**: Find the most purchased product based on total quantity sold.
10. **Frequent Buyers**: List customers who placed more than 3 orders.
11. **Average Order Value (AOV)**: Calculate the average order value for each customer.
12. **Cross-Category Orders**: Identify orders containing products from more than two distinct categories.
13. **Peak Sales Day**: Find the single day that recorded the highest total revenue.
14. **Category Ranking**: Retrieve the second most expensive product in each category using window functions.
15. **MoM Growth Rate**: Calculate the Month-over-Month (MoM) revenue growth percentage rate.
16. **Churn Risk**: Identify "Churned Customers" (customers who placed orders previously but nothing in the last 90 days).
17. **Cumulative Sales**: Calculate the running total of sales revenue ordered by date and order ID.
18. **Category Spending Rank**: Rank customers within each product category based on their total spending.
19. **Revenue Contribution**: Calculate the percentage contribution of each product to total company revenue.
20. **Customer Segmentation**: Classify customers into tiers (`VIP`, `Regular`, `New / Low Value`) based on total spending and order frequency using conditional logic (`CASE`).
