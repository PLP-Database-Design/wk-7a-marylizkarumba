CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100));

INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES 
    (101, 'John Doe', 'Laptop'),
    (101, 'John Doe', 'Mouse'),
    (102, 'Jane Smith', 'Tablet'),
    (102, 'Jane Smith', 'Keyboard'),
    (102, 'Jane Smith', 'Mouse'),
    (103, 'Emily Clark', 'Phone');


CREATE TABLE Customers (
    CustomerName VARCHAR(100),
    PRIMARY KEY (CustomerName));


CREATE TABLE OrderDetails_2NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (CustomerName) REFERENCES Customers(CustomerName));

INSERT INTO Customers (CustomerName)
VALUES 
    ('John Doe'),
    ('Jane Smith'),
    ('Emily Clark');

INSERT INTO OrderDetails_2NF (OrderID, CustomerName, Product, Quantity)
VALUES 
    (101, 'John Doe', 'Laptop', 2),
    (101, 'John Doe', 'Mouse', 1),
    (102, 'Jane Smith', 'Tablet', 3),
    (102, 'Jane Smith', 'Keyboard', 1),
    (102, 'Jane Smith', 'Mouse', 2),
    (103, 'Emily Clark', 'Phone', 1);
