# Occupations (Pivot Table)

Pivot the `Occupation` column in **OCCUPATIONS** so that each `Name` is sorted alphabetically and displayed underneath its corresponding `Occupation`. The output should consist of four columns (`Doctor`, `Professor`, `Singer`, and `Actor`) in that specific order, with their respective names listed alphabetically under each column.

**Note:** Print `NULL` when there are no more names corresponding to an occupation.

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
Jenny    Ashley     Meera  Jane
Samantha Christeen  Priya  Julia
NULL     Ketty      NULL   Maria
```

**Explanation:**
- The first column is an alphabetically ordered list of `Doctor` names.
- The second column is an alphabetically ordered list of `Professor` names.
- The third column is an alphabetically ordered list of `Singer` names.
- The fourth column is an alphabetically ordered list of `Actor` names.
- Empty cells are filled with `NULL`.

---

### MySQL Query

> **Ý tưởng:** 
> 1. Dùng `ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name)` để gán số thứ tự cho từng người theo thứ tự bảng chữ cái trong từng nghề nghiệp (`row_num`).
> 2. `GROUP BY row_num` và dùng `MAX(CASE ...)` để gom các tên cùng số thứ tự thành một dòng ngang theo 4 cột tương ứng.

```sql
SELECT 
    MAX(CASE WHEN Occupation = 'Doctor' THEN Name END) AS Doctor,
    MAX(CASE WHEN Occupation = 'Professor' THEN Name END) AS Professor,
    MAX(CASE WHEN Occupation = 'Singer' THEN Name END) AS Singer,
    MAX(CASE WHEN Occupation = 'Actor' THEN Name END) AS Actor
FROM (
    SELECT 
        Name, 
        Occupation, 
        ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name ASC) AS row_num
    FROM OCCUPATIONS
) AS RankedOccupations
GROUP BY row_num
ORDER BY row_num;
```
