CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(20),
    Address VARCHAR(255)
);
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL,
    Description TEXT
);
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10,2) NOT NULL,
    Stock INT NOT NULL,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE NOT NULL,
    CustomerID INT,
    Status VARCHAR(50),
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    PaymentDate DATE,
    PaymentMethod VARCHAR(50),
    Amount DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
CREATE TABLE Shippings (
    ShippingID INT PRIMARY KEY,
    OrderID INT,
    ShippingAddress VARCHAR(255),
    ShippingDate DATE,
    DeliveryDate DATE,
    ShippingStatus VARCHAR(50),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comment TEXT,
    ReviewDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
CREATE TABLE Admins (
    AdminID INT PRIMARY KEY,
    Username VARCHAR(50) UNIQUE,
    Password VARCHAR(100),
    FullName VARCHAR(100),
    Role VARCHAR(50)
);
CREATE TABLE Cart (
    CartID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    Quantity INT,
    DateAdded DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Customers VALUES 
(1, 'Ahmed', 'Ali', 'ahmed.ali@example.com', '0501234567', 'Riyadh, Saudi Arabia'),
(2, 'Fatima', 'Hassan', 'fatima.hassan@example.com', '0559876543', 'Jeddah, Saudi Arabia'),
(3, 'Mohammed', 'Salem', 'mohammed.salem@example.com', '0531112222', 'Dammam, Saudi Arabia'),
(4, 'Lama', 'Saad', 'lama.saad@example.com', '0562223333', 'Abha, Saudi Arabia'),
(5, 'Yousef', 'Khaled', 'yousef.khaled@example.com', '0584445555', 'Mecca, Saudi Arabia');

INSERT INTO Categories VALUES 
(1, 'Electronics', 'Devices and gadgets'),
(2, 'Clothing', 'Men and Women clothing'),
(3, 'Books', 'Printed and digital books'),
(4, 'Home Appliances', 'Appliances and tools for home'),
(5, 'Toys', 'Children toys and educational kits');

INSERT INTO Products VALUES 
(1, 'iPhone 14', 'Apple smartphone', 3999.00, 10, 1),
(2, 'T-shirt', 'Cotton T-shirt - M size', 59.00, 50, 2),
(3, 'Air Fryer', 'Digital Air Fryer 3.5L', 299.00, 20, 4),
(4, 'Harry Potter Book', 'Fantasy novel', 89.00, 30, 3),
(5, 'Lego Set', 'Classic 500 pieces', 149.00, 15, 5);

INSERT INTO Orders VALUES 
(101, '2025-04-01', 1, 'Shipped', 4058.00),
(102, '2025-04-02', 2, 'Processing', 118.00),
(103, '2025-04-05', 3, 'Delivered', 299.00),
(104, '2025-04-10', 4, 'Pending', 149.00),
(105, '2025-04-11', 5, 'Cancelled', 59.00);

INSERT INTO OrderDetails VALUES 
(1, 101, 1, 1, 3999.00),
(2, 101, 2, 1, 59.00),
(3, 102, 4, 1, 89.00),
(4, 102, 2, 1, 59.00),
(5, 104, 5, 1, 149.00);

INSERT INTO Payments VALUES 
(1, 101, '2025-04-01', 'Credit Card', 4058.00),
(2, 102, '2025-04-02', 'Mada', 118.00),
(3, 103, '2025-04-05', 'Cash on Delivery', 299.00),
(4, 104, '2025-04-10', 'Credit Card', 149.00),
(5, 105, '2025-04-11', 'Mada', 59.00);

INSERT INTO Shippings VALUES 
(1, 101, 'Riyadh, Saudi Arabia', '2025-04-01', '2025-04-03', 'Delivered'),
(2, 102, 'Jeddah, Saudi Arabia', '2025-04-02', '2025-04-05', 'In Transit'),
(3, 103, 'Dammam, Saudi Arabia', '2025-04-05', '2025-04-07', 'Delivered'),
(4, 104, 'Abha, Saudi Arabia', NULL, NULL, 'Pending'),
(5, 105, 'Mecca, Saudi Arabia', NULL, NULL, 'Cancelled');

INSERT INTO Reviews VALUES 
(1, 1, 1, 5, 'Excellent phone!', '2025-04-04'),
(2, 4, 2, 4, 'Nice book, enjoyed it.', '2025-04-05'),
(3, 3, 3, 3, 'Works fine but noisy.', '2025-04-06'),
(4, 5, 4, 5, 'My kids loved it!', '2025-04-07'),
(5, 2, 5, 2, 'Size was too small.', '2025-04-08');

INSERT INTO Admins VALUES 
(1, 'admin1', 'pass1234', 'Salem Al-Otaibi', 'Manager'),
(2, 'admin2', 'securepass', 'Huda Al-Nasser', 'Sales Admin'),
(3, 'admin3', 'admin@123', 'Ali Al-Mutairi', 'Support'),
(4, 'admin4', 'admin4567', 'Sara Al-Faraj', 'Inventory'),
(5, 'admin5', 'adminpass', 'Faisal Al-Qahtani', 'Marketing');

INSERT INTO Cart VALUES 
(1, 1, 5, 2, '2025-04-01'),
(2, 2, 2, 1, '2025-04-02'),
(3, 3, 1, 1, '2025-04-04'),
(4, 4, 4, 3, '2025-04-06'),
(5, 5, 3, 1, '2025-04-07');

-- 1. عرض كل العملاء
SELECT * FROM Customers;

-- 2. عرض أسماء المنتجات وأسعارها
SELECT ProductName, Price FROM Products;

-- 3. عرض الطلبات التي حالتها "Shipped"
SELECT * FROM Orders WHERE Status = 'Shipped';

-- 4. عرض الطلبات التي مجموعها أكثر من 300
SELECT * FROM Orders WHERE TotalAmount > 300;

-- 5. عرض المنتجات التي تنتمي لفئة Electronics
SELECT ProductName FROM Products WHERE CategoryID = 1;

-- 6. عرض الطلبات التي بين تاريخين
SELECT * FROM Orders WHERE OrderDate BETWEEN '2025-04-01' AND '2025-04-05';

-- 7. عرض التقييمات التي أكثر من 3 نجمات
SELECT * FROM Reviews WHERE Rating > 3;

-- 8. عرض المنتجات التي تحتوي على كلمة "Book"
SELECT * FROM Products WHERE ProductName LIKE '%Book%';

-- 9. عرض العملاء مرتبين حسب الاسم الأول تصاعديًا
SELECT * FROM Customers ORDER BY FirstName ASC;

-- 10. عرض أسماء الفئات وعدد المنتجات في كل فئة
SELECT CategoryID, COUNT(*) AS ProductCount FROM Products GROUP BY CategoryID;





-- 11. Inner Join بين Orders و Customers
SELECT Orders.OrderID, Customers.FirstName
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

-- 12. Left Join بين Products و Categories
SELECT Products.ProductName, Categories.CategoryName
FROM Products
LEFT JOIN Categories ON Products.CategoryID = Categories.CategoryID;

-- 13. Right Join بين Products و Categories
SELECT Products.ProductName, Categories.CategoryName
FROM Products
RIGHT JOIN Categories ON Products.CategoryID = Categories.CategoryID;

-- 14. Full Join (محاكي باستخدام UNION)
SELECT Products.ProductName, Categories.CategoryName
FROM Products
LEFT JOIN Categories ON Products.CategoryID = Categories.CategoryID
UNION
SELECT Products.ProductName, Categories.CategoryName
FROM Products
RIGHT JOIN Categories ON Products.CategoryID = Categories.CategoryID;

-- 15. Natural Join بين OrderDetails و Products (مفترض توافق اسم العمود)
SELECT * FROM OrderDetails
NATURAL JOIN Products;






-- 16. تحديث عنوان أحد العملاء
UPDATE Customers SET Address = 'Updated Address' WHERE CustomerID = 1;

-- 17. حذف منتج من جدول Cart
DELETE FROM Cart WHERE CartID = 5;

-- 18. تعديل اسم عمود في جدول Admins
ALTER TABLE Admins RENAME COLUMN FullName TO AdminName;

-- 19. تغيير نوع عمود في Products
ALTER TABLE Products ALTER COLUMN Description TYPE VARCHAR(200);

-- 20. إعادة تسمية جدول Shippings
ALTER TABLE Shippings RENAME TO Shipments;





-- 21. مجموع الطلبات لكل عميل
SELECT CustomerID, SUM(TotalAmount) AS TotalSpent
FROM Orders
GROUP BY CustomerID;

-- 22. عدد الطلبات لكل حالة
SELECT Status, COUNT(*) FROM Orders GROUP BY Status;

-- 23. معدل التقييم لكل منتج
SELECT ProductID, AVG(Rating) AS AvgRating
FROM Reviews
GROUP BY ProductID;

-- 24. عرض المنتجات التي متوسط تقييمها أكبر من 4
SELECT ProductID, AVG(Rating) AS AvgRating
FROM Reviews
GROUP BY ProductID
HAVING AVG(Rating) > 4;

-- 25. أعلى سعر منتج في كل فئة
SELECT CategoryID, MAX(Price) FROM Products GROUP BY CategoryID;





-- 26. استعلام يستخدم CASE لتحديد حالة التوصيل
SELECT ShippingID, 
       CASE 
         WHEN ShippingStatus = 'Delivered' THEN 'وصلت'
         WHEN ShippingStatus = 'In Transit' THEN 'قيد التوصيل'
         ELSE 'غير معروفة'
       END AS StatusText
FROM Shipments;

-- 27. استعلام داخلي: عرض المنتجات الأعلى سعرًا
SELECT * FROM Products
WHERE Price = (SELECT MAX(Price) FROM Products);

-- 28. المنتجات الموجودة في الطلبات فقط
SELECT * FROM Products
WHERE ProductID IN (SELECT ProductID FROM OrderDetails);

-- 29. العملاء الذين قدموا تقييمات
SELECT * FROM Customers
WHERE CustomerID IN (SELECT CustomerID FROM Reviews);

-- 30. العملاء الذين لم يطلبوا أي شيء
SELECT * FROM Customers
WHERE CustomerID NOT IN (SELECT CustomerID FROM Orders);





-- 31. البحث عن العملاء الذين بريدهم يحتوي على "example"
SELECT * FROM Customers WHERE Email LIKE '%example%';

-- 32. الطلبات بين 100 و 200 ريال
SELECT * FROM Orders WHERE TotalAmount BETWEEN 100 AND 200;

-- 33. المنتجات في فئات معينة
SELECT * FROM Products WHERE CategoryID IN (1, 2, 3);

-- 34. عرض الفئات الفريدة الموجودة في المنتجات
SELECT DISTINCT CategoryID FROM Products;

-- 35. العملاء الذين أسماؤهم تبدأ بحرف "A"
SELECT * FROM Customers WHERE FirstName LIKE 'A%';






-- 36. عرض كل المسؤولين
SELECT * FROM Admins;

-- 37. المسؤولين بدور "Manager"
SELECT * FROM Admins WHERE Role = 'Manager';

-- 38. عدد المسؤولين في كل دور
SELECT Role, COUNT(*) FROM Admins GROUP BY Role;

-- 39. تغيير كلمة المرور للمسؤول admin1
UPDATE Admins SET Password = 'newpassword' WHERE Username = 'admin1';

-- 40. حذف مسؤول اسمه Sara
DELETE FROM Admins WHERE AdminName = 'Sara Al-Faraj';




-- 41. عرض محتوى السلة لكل عميل
SELECT CustomerID, COUNT(*) AS Items FROM Cart GROUP BY CustomerID;

-- 42. عرض المنتجات الموجودة في السلة أكثر من مرة
SELECT ProductID, COUNT(*) FROM Cart GROUP BY ProductID HAVING COUNT(*) > 1;

-- 43. عرض إجمالي عدد الطلبات
SELECT COUNT(*) FROM Orders;

-- 44. عرض مجموع المبيعات
SELECT SUM(TotalAmount) AS TotalSales FROM Orders;

-- 45. عرض المنتجات التي سعرها أعلى من متوسط السعر
SELECT * FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);



-- 46. عدد الطلبات لكل عميل + الاسم
SELECT C.FirstName, COUNT(O.OrderID) AS OrderCount
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.FirstName;

-- 47. المنتجات غير الموجودة في أي طلب
SELECT * FROM Products
WHERE ProductID NOT IN (SELECT ProductID FROM OrderDetails);

-- 48. عرض أول 3 عملاء حسب الإنفاق
SELECT CustomerID, SUM(TotalAmount) AS Spent
FROM Orders
GROUP BY CustomerID
ORDER BY Spent DESC
LIMIT 3;

-- 49. الطلبات التي تشمل منتج باسم "iPhone 14"
SELECT O.OrderID
FROM Orders O
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
JOIN Products P ON OD.ProductID = P.ProductID
WHERE P.ProductName = 'iPhone 14';

-- 50. مراجعة العملاء للمنتج الأعلى تقييمًا
SELECT * FROM Reviews
WHERE ProductID = (
  SELECT ProductID
  FROM Reviews
  GROUP BY ProductID
  ORDER BY AVG(Rating) DESC
  LIMIT 1
);