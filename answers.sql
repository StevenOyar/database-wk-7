-- Week 6 Assignment - Database Normalization

-- Orders table
CREATE TABLE OrderDetail(
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
);

-- Products table
CREATE TABLE ProductDetail(
    ProductId INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductName VARCHAR(20),
    FOREIGN KEY (OrderID) REFERENCES OrderDetail(OrderID)
);

-- Insert order data
INSERT INTO OrderDetail(OrderID, CustomerName)
VALUES 
    (101, "John Doe"),
    (102, "Jane Smith"),
    (103, "Emily Clark");

-- Insert product data
INSERT INTO ProductDetail(OrderID, ProductName)
VALUES 
    (101, "Laptop"),
    (101, "Mouse"),
    (102, "Tablet"),
    (102, "Keyboard"),
    (102, "Mouse"),
    (103, "Phone");

-- 2NF Normalization
-- Orders table
CREATE TABLE OrderDetails(
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50) NOT NULL
);

-- Products table
CREATE TABLE Products(
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(20) NOT NULL
);

-- Order-Product junction table
CREATE TABLE OrderQuantity(
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY(OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES OrderDetails(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert order data
INSERT INTO OrderDetails(OrderID, CustomerName)
VALUES 
    (101, "John Doe"),
    (102, "Jane Smith"),
    (103, "Emily Clark");

-- Insert product data
INSERT INTO Products(ProductID, ProductName)
VALUES 
    (1, "Laptop"),
    (2, "Mouse"),
    (3, "Tablet"),
    (4, "Keyboard"),
    (5, "Phone");

-- Insert order quantities
INSERT INTO OrderQuantity(OrderID, ProductID, Quantity)
VALUES 
    (101, 1, 2),
    (101, 2, 1),
    (102, 3, 3),
    (102, 4, 1),
    (102, 2, 2),
    (103, 5, 1);