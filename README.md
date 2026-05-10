<div align="center">
  <h1>🛒 E-Commerce Database Management System</h1>
  <p><b>A Comprehensive SQL Project for Online Store Operations</b></p>
</div>

---

## 📌 Project Overview
This project demonstrates a complete backend database schema for an e-commerce platform. It covers everything from customer management and product categorization to order processing, payments, and administrative control.

The project includes:
*   **Schema Design:** 10 interconnected tables with primary and foreign key constraints.
*   **Data Seeding:** Sample data tailored for the Saudi market (Riyadh, Jeddah, etc.).
*   **50 Analytical Queries:** Ranging from basic CRUD operations to advanced data analysis using Aggregations, Joins, and Subqueries.

---

## 🛠️ Database Schema
The database consists of the following entities:

1.  **Customers**: Personal details of registered users.
2.  **Categories**: Product groupings (Electronics, Clothing, etc.).
3.  **Products**: Inventory items with pricing and stock levels.
4.  **Orders & OrderDetails**: Transactional data linking customers to products.
5.  **Payments**: Financial records for completed orders.
6.  **Shipments**: Tracking delivery status and addresses.
7.  **Reviews**: Customer feedback and ratings (1-5 stars).
8.  **Admins**: Management accounts and roles.
9.  **Cart**: Temporary storage for user selections.

---

## 🚀 Key SQL Features Demonstrated
The script provides solutions for real-world scenarios:

*   **Joins:** Inner, Left, Right, and Full Outer Joins to combine data across tables.
*   **Aggregations:** Calculating total sales (`SUM`), average ratings (`AVG`), and order counts (`COUNT`).
*   **Business Logic:** Using `CASE` statements to translate shipping statuses into user-friendly text.
*   **Advanced Filtering:** Using `HAVING` for group-level conditions and `Subqueries` to find top-performing products or inactive customers.
*   **Data Integrity:** Implementation of `UNIQUE` constraints and `CHECK` constraints for ratings.

---

## 📂 Project Structure
```text
├── schema.sql         # Table creation scripts
├── seeds.sql          # Sample data insertion
└── queries.sql        # The 50 analytical queries
