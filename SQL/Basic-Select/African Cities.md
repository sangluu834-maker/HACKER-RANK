# African Cities

Given the **CITY** and **COUNTRY** tables, query the names of all cities where the `CONTINENT` is `'Africa'`.

**Note:** `CITY.CountryCode` and `COUNTRY.Code` are matching key columns.

---

### Table Description

#### CITY
| Field | Type |
| :--- | :--- |
| `ID` | NUMBER |
| `NAME` | VARCHAR2(17) |
| `COUNTRYCODE` | VARCHAR2(3) |
| `DISTRICT` | VARCHAR2(20) |
| `POPULATION` | NUMBER |

#### COUNTRY
| Field | Type |
| :--- | :--- |
| `CODE` | VARCHAR2(3) |
| `NAME` | VARCHAR2(44) |
| `CONTINENT` | VARCHAR2(13) |
| `REGION` | VARCHAR2(25) |
| `SURFACEAREA` | NUMBER |
| `INDEPYEAR` | NUMBER |
| `POPULATION` | NUMBER |
| `LIFEEXPECTANCY` | NUMBER |
| `GNP` | NUMBER |
| `GNPOLD` | NUMBER |
| `LOCALNAME` | VARCHAR2(44) |
| `GOVERNMENTFORM` | VARCHAR2(45) |
| `HEADOFSTATE` | VARCHAR2(32) |
| `CAPITAL` | NUMBER |
| `CODE2` | VARCHAR2(2) |

---

### MySQL Query

```sql
SELECT CITY.NAME
FROM CITY
JOIN COUNTRY ON CITY.COUNTRYCODE = COUNTRY.CODE
WHERE COUNTRY.CONTINENT = 'Africa';
```
