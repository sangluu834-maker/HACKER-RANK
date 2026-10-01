# Weather Observation Station 14 .

## 1. Đề bài
Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than . Truncate your answer to  decimal places.
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
SELECT TRUNCATE(MAX(LAT_N), 4) 
FROM STATION 
WHERE LAT_N < 137.2345;
