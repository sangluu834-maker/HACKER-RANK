# Japan Population

Query the sum of the populations for all Japanese cities in **CITY**. The `COUNTRYCODE` for Japan is `'JPN'`.

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
SELECT SUM(POPULATION)
FROM CITY
WHERE COUNTRYCODE = 'JPN';
```
