# Revising the Select Query II

## 1. Đề bài
Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.

The CITY table is described as follows:


## 2. Bảng CITY

| Field | Type |
|---|---|
| ID | NUMBER |
| NAME | VARCHAR2(17) |
| COUNTRYCODE | VARCHAR2(3) |
| DISTRICT | VARCHAR2(20) |
| POPULATION | NUMBER |

## 3. SQL

```sql
SELECT NAME
FROM CITY
WHERE Countrycode  = 'USA'
AND POPULATION > 120000;
