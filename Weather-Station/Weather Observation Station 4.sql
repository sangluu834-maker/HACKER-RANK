# Weather Observation Station 4.
## 1. Đề bài
Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
The STATION table is described as follows:


## 2. Bảng CITY

| Field | Type |
|---|---|
| ID | NUMBER |
| NAME | VARCHAR2(21) |
| COUNTRYCODE | VARCHAR2(2) |
|LAT-N  | NUMBER |
| LONG-W | NUMBER |

## 3. SQL

```sql
SELECT COUNT(CITY) - COUNT(DISTINCT CITY)
FROM STATION;
