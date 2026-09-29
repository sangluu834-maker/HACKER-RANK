# Higher Than 75 Marks
## 1. Đề bài
/*
PROBLEM STATEMENT:
Query the Name of any student in STUDENTS who scored higher than 75 Marks. 
Order your output by the last three characters of each name. 
If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), 
secondary sort them by ascending ID.
*/

-- CREATE STUDENTS TABLE
CREATE TABLE STUDENTS (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Marks INT
);

-- INSERT SAMPLE DATA INTO THE TABLE
INSERT INTO STUDENTS (ID, Name, Marks) VALUES
(1, 'Ashley', 81),
(2, 'Samantha', 75),
(4, 'Julia', 76),
(3, 'Belvet', 84);


## 3. SQL

```sql
SELECT Name
FROM STUDENTS
WHERE Marks > 75
ORDER BY RIGHT(Name, 3), ID ASC;
