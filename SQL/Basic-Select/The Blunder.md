# The Blunder

Samantha was tasked with calculating the average monthly salaries for all employees in the **EMPLOYEES** table, but did not realize her keyboard's `0` key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary.

Write a query calculating the amount of error (i.e.: $\text{actual} - \text{miscalculated}$ average monthly salaries), and round it up to the next integer.

---

### Table Description
The **EMPLOYEES** table is described as follows:

| Column | Type |
| :--- | :--- |
| `ID` | Integer |
| `Name` | String |
| `Salary` | Integer |

**Note:** Salary is per month.

### Constraints
- $1000 < \text{Salary} < 10^5$

---

### Sample Output
```text
2061
```

**Explanation:**
- Actual average salary: $4046.25$
- Miscalculated average salary (zeros removed): $1985.25$
- Difference (error): $4046.25 - 1985.25 = 2061.00$
- Rounded up to the next integer using `CEIL`: `2061`.

---

### MySQL Query

```sql
SELECT CEIL(AVG(Salary) - AVG(REPLACE(Salary, '0', '')))
FROM EMPLOYEES;
```
