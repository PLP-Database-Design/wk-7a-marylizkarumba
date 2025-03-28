-- Create a new table in 1NF
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100)
);

-- Insert data, splitting the Products column
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES 
    (101, 'John Doe', 'Laptop'),
    (101, 'John Doe', 'Mouse'),
    (102, 'Jane Smith', 'Tablet'),
    (102, 'Jane Smith', 'Keyboard'),
    (102, 'Jane Smith', 'Mouse'),
    (103, 'Emily Clark', 'Phone');

The original table violates 1NF because the Products column contains multiple values
In the 1NF version, we create a new table ProductDetail_1NF
Each row now represents a single product for an order
For orders with multiple products (like Order 101 and 102), we create multiple rows
The OrderID and CustomerName are repeated for each product

Key changes:

Removed the multi-value Products column
Created a new Product column with single values
Ensured each row represents a unique order-product combination

This normalization eliminates the following 1NF violations:

Repeating groups in the Products column
Each row now contains atomic (indivisible) values
Each row is uniquely identifiable.






  
2. -- Create a new Customer table
CREATE TABLE Customers (
    CustomerName VARCHAR(100),
    PRIMARY KEY (CustomerName)
);

-- Create a new OrderDetails table in 2NF
CREATE TABLE OrderDetails_2NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (CustomerName) REFERENCES Customers(CustomerName)
);

-- Insert data into Customers table
INSERT INTO Customers (CustomerName)
VALUES 
    ('John Doe'),
    ('Jane Smith'),
    ('Emily Clark');

-- Insert data into OrderDetails_2NF table
INSERT INTO OrderDetails_2NF (OrderID, CustomerName, Product, Quantity)
VALUES 
    (101, 'John Doe', 'Laptop', 2),
    (101, 'John Doe', 'Mouse', 1),
    (102, 'Jane Smith', 'Tablet', 3),
    (102, 'Jane Smith', 'Keyboard', 1),
    (102, 'Jane Smith', 'Mouse', 2),
    (103, 'Emily Clark', 'Phone', 1);



Identifying the Issue in 1NF:

The original table had a partial dependency
CustomerName depends only on OrderID, not on the entire primary key (OrderID, Product)


Solution:

Created a separate Customers table with CustomerName as the primary key
Created a new OrderDetails_2NF table
The new table has a composite primary key (OrderID, Product)
Added a foreign key to link to the Customers table



Key changes:

Removed partial dependency
CustomerName is now in a separate table
OrderDetails_2NF table fully depends on its entire primary key
Introduced referential integrity with a foreign key

Benefits:

Eliminates data redundancy
Ensures data integrity
Allows for easier updates to customer information

The table is now in 2NF because:

It is already in 1NF
Non-key columns fully depend on the entire primary key
Partial dependencies have been removed.





