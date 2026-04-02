# 65317A SQL SELECT Tutorial for Beginners Answers

### Challenge Section Answers

1. **JSON Aggregation** Use `JSON_ARRAYAGG` to list all employee names in a single JSON array per department.
```sql
SELECT DepartmentID, 
       JSON_ARRAYAGG(FirstName + ' ' + LastName) AS EmployeeArray
FROM Employees
GROUP BY DepartmentID;

```


2. **Regex Filtering** Find all employees whose last names start with 'S' or 'J' using `REGEXP_LIKE`.
```sql
SELECT FirstName, LastName
FROM Employees
WHERE REGEXP_LIKE(LastName, '^[SJ].*');

```


3. **Salary Analysis** Find the highest, lowest, and average salary for each department.
```sql
SELECT DepartmentID,
       MAX(Salary) AS HighestSalary,
       MIN(Salary) AS LowestSalary,
       AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY DepartmentID;

```



---

### Knowledge Check Answers

1. **How does the native `JSON` type in SQL Server 2025 differ from the old `NVARCHAR` approach?**
* The native `JSON` type stores data in a binary format that is optimized for performance and storage.
* Unlike `NVARCHAR`, it allows for built-in validation to ensure the data is well-formed and provides faster query execution when extracting specific keys or values.


2. **Which function is used to calculate the similarity between two `VECTOR` columns?**
* The `VECTOR_DISTANCE` function is used to calculate similarity.
* It supports different metrics, such as 'cosine', 'euclidean', and 'dot product', to determine how closely two vectors align in a multi-dimensional space.


3. **Write a query to find employees hired after 2020 using the new `DATE_BUCKET` function.**
* This query buckets hire dates by year and filters for buckets starting after 2020.


```sql
SELECT FirstName, LastName, HireDate
FROM Employees
WHERE DATE_BUCKET(YEAR, 1, HireDate) >= '2021-01-01';

```


4. **Write a query to show all employees associated with the project "Project Beta," including each employee's first and last name, and the project name.**
```sql
SELECT Employees.FirstName, Employees.LastName, Projects.ProjectName
FROM Employees
JOIN Projects ON Employees.DepartmentID = Projects.DepartmentID
WHERE Projects.ProjectName = 'Project Beta';

```
