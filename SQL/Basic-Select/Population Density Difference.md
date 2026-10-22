# Population Density Difference

Query the difference between the maximum and minimum populations in **CITY**.

---

### Table Description
The **CITY** table is described as follows:

| Field | Type |
| :--- | :--- |
| `ID` | NUMBER |
| `NAME` | VARCHAR2(17) |
| `COUNTRYCODE` | VARCHAR2(3) |
| `DISTRICT` | VARCHAR2(20) |
| `POPULATION` | NUMBER |

---

### MySQL Query

```sql
SELECT MAX(POPULATION) - MIN(POPULATION)
FROM CITY;
```
