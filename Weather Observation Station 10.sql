# Weather Observation Station 10
## 1. Đề bài
Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
Input Format
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
SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT LIKE '%a'
  AND CITY NOT LIKE '%e'
  AND CITY NOT LIKE '%i'
  AND CITY NOT LIKE '%o'
  AND CITY NOT LIKE '%u';
