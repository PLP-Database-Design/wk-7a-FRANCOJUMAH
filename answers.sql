
-- QUESTION 1
CREATE TABLE NormalizedProductDetail (
    OrderID INT,
    CustomerName VARCHAR(255),
    Product VARCHAR(255)
);

INSERT INTO NormalizedProductDetail (OrderID, CustomerName, Product)
VALUES 
    (101, 'John Doe', 'Laptop'),
    (101, 'John Doe', 'Mouse'),
    (102, 'Jane Smith', 'Tablet'),
    (102, 'Jane Smith', 'Keyboard'),
    (102, 'Jane Smith', 'Mouse'),
    (103, 'Emily Clark', 'Phone');

    -- A new table, NormalizedProductDetail, is created to store individual products per row


-- QUESTION 2

-- Create a new Customers table
CREATE TABLE Customers (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(255)
);

-- Insert unique customer details (removing redundancy)
INSERT INTO Customers (OrderID, CustomerName)
VALUES 
    (101, 'John Doe'),
    (102, 'Jane Smith'),
    (103, 'Emily Clark');

-- Create a new OrderDetails table (without CustomerName)
CREATE TABLE OrderDetails (
    OrderID INT,
    Product VARCHAR(255),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Customers(OrderID)
);

-- Insert normalized order details
INSERT INTO OrderDetails (OrderID, Product, Quantity)
VALUES
    (101, 'Laptop', 2),
    (101, 'Mouse', 1),
    (102, 'Tablet', 3),
    (102, 'Keyboard', 1),
    (102, 'Mouse', 2),
    (103, 'Phone', 1);