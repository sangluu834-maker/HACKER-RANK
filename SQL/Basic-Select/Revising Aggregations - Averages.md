# Revising Aggregations - The Averages

Query the average population of all cities in **CITY** where District is 'California'.

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
SELECT AVG(POPULATION)
FROM CITY
WHERE DISTRICT = 'California';
```
