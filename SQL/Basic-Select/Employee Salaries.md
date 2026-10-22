# Employee Salaries

Write a query that prints a list of employee names (i.e.: the `name` attribute) for employees in **Employee** having a salary greater than $\$2000$ per month who have been employees for less than $10$ months. Sort your result by ascending `employee_id`.

---

### Table Description
The **Employee** table containing employee data for a company is described as follows:

| Column | Type |
| :--- | :--- |
| `employee_id` | Integer |
| `name` | String |
| `months` | Integer |
| `salary` | Integer |

- `employee_id`: an employee's ID number.
- `name`: the employee's name.
- `months`: the total number of months they've been working for the company.
- `salary`: their monthly salary.

---

### Sample Output
```text
Angela
Michael
Todd
Joe
```

**Explanation:**
- Angela has been an employee for $1$ month and earns $\$3443$ per month ($> 2000$, $< 10$).
- Michael has been an employee for $6$ months and earns $\$2017$ per month ($> 2000$, $< 10$).
- Todd has been an employee for $5$ months and earns $\$3396$ per month ($> 2000$, $< 10$).
- Joe has been an employee for $9$ months and earns $\$3573$ per month ($> 2000$, $< 10$).
- Results are ordered by ascending `employee_id`.

---

### MySQL Query

```sql
SELECT name 
FROM Employee 
WHERE salary > 2000 
  AND months < 10 
ORDER BY employee_id ASC;
```
