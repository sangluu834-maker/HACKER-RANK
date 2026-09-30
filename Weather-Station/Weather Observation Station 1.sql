# Weather Observation Station 1.

## 1. Đề bài
Query a list of CITY and STATE from the STATION table.
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
SELECT CITY, STATE
FROM STATION;
