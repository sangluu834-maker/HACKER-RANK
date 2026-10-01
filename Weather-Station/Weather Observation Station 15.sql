# Weather Observation Station 15.

## 1. Đề bài
Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than . Round your answer to  decimal places.
Input Format
The STATION table is described as follows:



## 2. Bảng CITY

| Field | Type |
|---|---|
| ID | NUMBER |
| NAME | VARCHAR2(21) |
| COUNTRYCODE | VARCHAR2(2) |
| LAT-N | NUMBER |
| LONG-W | NUMBER |

## 3. SQL

```sql
SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N < 137.2345
ORDER BY LAT_N DESC
LIMIT 1;
