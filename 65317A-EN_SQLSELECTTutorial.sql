--- SQL SELECT for Beginners Lab
--- Prepared for 65xxx course lab environment on www.softwaretutorialservices.com

-- Database and Table Setup Script
USE master
GO

IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'SQLSelectLab')
DROP DATABASE SQLSelectLab;
GO

CREATE DATABASE SQLSelectLab;
GO

USE SQLSelectLab;
GO

-- Create Departments Table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName NVARCHAR(50)
);
GO

-- Create Employees Table (Updated with SQL 2025 Native JSON)
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10, 2),
    HireDate DATE,
    -- SQL 2025: Native JSON for flexible metadata
    EmployeeMetadata JSON, 
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
GO
  
-- Create Projects Table (Updated with SQL 2025 VECTOR)
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName NVARCHAR(50),
    DepartmentID INT,
    Budget DECIMAL(10, 2),
    -- SQL 2025: Vector for AI-driven similarity (Priority, Risk, Complexity)
    ProjectVector VECTOR(3),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
GO

-- Insert Sample Data for Departments
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES (1, 'Sales'), (2, 'Engineering'), (3, 'HR'), (4, 'Marketing'), (5, 'Legal');

-- Insert Sample Data for Employees
INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, Salary, HireDate, EmployeeMetadata)
VALUES
(1, 'Alice', 'Johnson', 1, 70000, '2018-04-23', '{"Level": "Senior", "Remote": true}'),
(2, 'Bob', 'Smith', 2, 90000, '2019-06-15', '{"Level": "Lead", "Remote": false}'),
(3, 'Carol', 'Davis', 2, 85000, '2020-02-28', '{"Level": "Mid", "Remote": true}'),
(4, 'Dan', 'Brown', 3, 60000, '2017-11-10', NULL),
(5, 'Eve', 'Wilson', 1, 75000, '2021-08-22', '{"Level": "Junior", "Remote": true}'),
(6, 'Frank', 'White', 4, 65000, '2021-01-15', NULL),
(7, 'Grace', 'Green', 5, 80000, '2019-05-18', '{"Level": "Senior", "Remote": false}'),
(8, 'Henry', 'Black', 2, 95000, '2018-12-12', '{"Level": "Principal", "Remote": false}'),
(9, 'Ivy', 'Miller', 1, 70000, '2020-11-22', NULL),
(10, 'Jack', 'Taylor', 3, 55000, '2017-07-10', NULL),
(11, 'Katie', 'Brown', 5, 72000, '2018-04-12', NULL),
(12, 'Leo', 'Jones', 4, 67000, '2019-03-09', NULL),
(13, 'Mary', 'Dixon', 1, 76000, '2020-01-28', NULL),
(14, 'Nathan', 'Young', 2, 84000, '2021-09-10', NULL),
(15, 'Olivia', 'King', 5, 83000, '2017-08-15', NULL),
(16, 'Paul', 'Scott', 2, 91000, '2019-07-25', NULL),
(17, 'Quincy', 'Adams', 4, 64000, '2021-06-22', NULL),
(18, 'Rachel', 'Perry', 3, 58000, '2020-02-15', NULL),
(19, 'Sam', 'Clark', 2, 92000, '2018-10-02', NULL),
(20, 'Tina', 'Ross', 1, 78000, '2019-12-30', NULL);

-- Insert Sample Data for Projects (Including Vector embeddings)
INSERT INTO Projects (ProjectID, ProjectName, DepartmentID, Budget, ProjectVector)
VALUES
(1, 'Project Alpha', 1, 50000, '[0.8, 0.2, 0.3]'),
(2, 'Project Beta', 2, 120000, '[0.5, 0.9, 0.8]'),
(3, 'Project Gamma', 3, 40000, '[0.2, 0.1, 0.2]'),
(4, 'Project Delta', 4, 80000, '[0.6, 0.4, 0.5]'),
(5, 'Project Epsilon', 5, 60000, '[0.3, 0.7, 0.4]');
