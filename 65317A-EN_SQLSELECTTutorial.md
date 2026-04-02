# 65317A SQL SELECT Tutorial for Beginners Exercise

## Objectives
- Practice using `SELECT` statements to query and filter records.
- Learn to use JOIN operations.
- Use grouping and aggregation functions.
- **New for 2025:** Explore JSON data handling and Vector similarity.

### Estimated Time
45 - 60 minutes

---

## Lab Setup Instructions

1. Open SQL Server Management Studio (SSMS) or Visual Studio Code (MSSQL extension).
2. Run the setup script `65317A-EN_SQLSELECTTutorial.sql` to create the database and tables.

---

## Exercises:
### Exercise 1: Familiarize Yourself with the Tables
-- Verify the setup by querying the three tables in the `SQLSelectLab` database.

```sql
SELECT * FROM Departments;
SELECT * FROM Employees;
SELECT * FROM Projects;
```

### Exercise 2: Filtering by Rows and Columns
-- Engineering Department only
```sql
SELECT * FROM Employees WHERE DepartmentID = 2;

-- Specific column selection
SELECT FirstName, LastName, Salary
FROM Employees
WHERE DepartmentID = 1 AND Salary > 70000;
```

### Exercise 3: Sorting Data with ORDER BY
-- Newest employees first
```sql
SELECT FirstName, LastName, HireDate
FROM Employees
ORDER BY HireDate DESC;
```

### Exercise 4: Grouping and Aggregating Data with GROUP BY
-- Calculate department statistics.

```sql
SELECT DepartmentID, AVG(Salary) AS AverageSalary, COUNT(EmployeeID) AS EmployeeCount
FROM Employees
GROUP BY DepartmentID;
```

### Exercise 5: Basic JOIN Exercises
-- Connect tables using shared keys.

```sql
SELECT Employees.FirstName, Employees.LastName, Departments.DepartmentName
FROM Employees
JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;
```

### Exercise 6: SQL Server 2025 New Features
-- Experience the modern capabilities of SQL Server 2025.

Handling JSON Data
SQL Server 2025 treats JSON as a native type. Extract specific values from the EmployeeMetadata column.
```sql
SELECT FirstName, LastName, EmployeeMetadata.Level
FROM Employees
WHERE EmployeeMetadata IS NOT NULL;
```

Vector Similarity Search
Find projects with a similar risk/priority profile to a target vector.
```sql
DECLARE @TargetProfile VECTOR(3) = '[0.7, 0.3, 0.4]';

SELECT ProjectName, VECTOR_DISTANCE('cosine', ProjectVector, @TargetProfile) AS Similarity
FROM Projects
ORDER BY Similarity;
```

---

## Challenge Section

1. **JSON Aggregation**: Use `JSON_ARRAYAGG` to list all employee names in a single JSON array per department.
2. **Regex Filtering**: Find all employees whose last names start with 'S' or 'J' using `REGEXP_LIKE`.
3. **Salary Analysis**: Find the highest, lowest, and average salary for each department.

---

## Knowledge Check

1. How does the native `JSON` type in SQL Server 2025 differ from the old `NVARCHAR` approach?
2. Which function is used to calculate the similarity between two `VECTOR` columns?
3. Write a query to find employees hired after 2020 using the new `DATE_BUCKET` function.
