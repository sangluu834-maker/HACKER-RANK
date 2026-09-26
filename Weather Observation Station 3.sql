# Weather Observation Station 3.

## 1. Đề bài

Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.
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
SELECT DISTINCT CITY 
FROM STATION
WHERE MOD(ID, 2) = 0;
