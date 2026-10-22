# The PADS

Generate the following two result sets:

1. Query an alphabetically ordered list of all names in **OCCUPATIONS**, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: `AnActorName(A)`, `ADoctorName(D)`, `AProfessorName(P)`, and `ASingerName(S)`.
2. Query the number of occurrences of each occupation in **OCCUPATIONS**. Sort the occurrences in ascending order, and output them in the following format:
   ```text
   There are a total of [occupation_count] [occupation]s.
   ```
   where `[occupation_count]` is the number of occurrences of an occupation in **OCCUPATIONS** and `[occupation]` is the lowercase occupation name. If more than one Occupation has the same `[occupation_count]`, they should be ordered alphabetically.

**Note:** There will be at least two entries in the table for each type of occupation.

---

### Table Description
The **OCCUPATIONS** table is described as follows:

| Column | Type |
| :--- | :--- |
| `Name` | String |
| `Occupation` | String |

`Occupation` will only contain one of the following values: `Doctor`, `Professor`, `Singer`, or `Actor`.

---

### Sample Output
```text
Ashely(P)
Christeen(P)
Jane(A)
Jenny(D)
Julia(A)
Ketty(P)
Maria(A)
Meera(S)
Priya(S)
Samantha(D)
There are a total of 2 doctors.
There are a total of 2 singers.
There are a total of 3 actors.
There are a total of 3 professors.
```

**Explanation:**
- The results of the first query are formatted to the problem description's specifications and ordered alphabetically by `Name`.
- The results of the second query are ascendingly ordered first by number of names corresponding to each profession, and then alphabetically by profession.

---

### MySQL Solution

```sql
/* Query 1: Format Name(O) and sort alphabetically by Name */
SELECT CONCAT(Name, '(', SUBSTRING(Occupation, 1, 1), ')')
FROM OCCUPATIONS
ORDER BY Name ASC;

/* Query 2: Count occurrences and format sentence, sorted by count then occupation name */
SELECT CONCAT('There are a total of ', COUNT(Occupation), ' ', LOWER(Occupation), 's.')
FROM OCCUPATIONS
GROUP BY Occupation
ORDER BY COUNT(Occupation) ASC, Occupation ASC;
```
