# Top Earners

We define an employee's total earnings to be their monthly `salary * months` worked, and the maximum total earnings to be the maximum total earnings for any employee in the **Employee** table. Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as $2$ space-separated integers.

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
69952 1
```

**Explanation:**
The maximum earnings value is $69952$. The only employee with earnings $69952$ is Kimberly, so we print the maximum earnings value ($69952$) and a count of the number of employees who have earned that maximum value ($1$) as two space-separated values.

---

### MySQL Query

```sql
SELECT (months * salary) AS total_earnings, COUNT(*)
FROM Employee
GROUP BY total_earnings
ORDER BY total_earnings DESC
LIMIT 1;
```
