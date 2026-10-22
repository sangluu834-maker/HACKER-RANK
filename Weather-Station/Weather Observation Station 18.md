# Weather Observation Station 18

Consider $P_1(a, b)$ and $P_2(c, d)$ to be two points on a 2D plane:
- $a$ happens to equal the minimum value in Northern Latitude (`LAT_N` in **STATION**).
- $b$ happens to equal the minimum value in Western Longitude (`LONG_W` in **STATION**).
- $c$ happens to equal the maximum value in Northern Latitude (`LAT_N` in **STATION**).
- $d$ happens to equal the maximum value in Western Longitude (`LONG_W` in **STATION**).

Query the Manhattan Distance between points $P_1$ and $P_2$ and round it to a scale of $4$ decimal places.

---

### Formula
The Manhattan Distance between two points $(x_1, y_1)$ and $(x_2, y_2)$ is:
$$\text{Distance} = |x_1 - x_2| + |y_1 - y_2| = (c - a) + (d - b)$$
*(Since $c = \max, a = \min$ and $d = \max, b = \min$, we always have $c \ge a$ and $d \ge b$)*

---

### Table Description
The **STATION** table is described as follows:

| Field | Type |
| :--- | :--- |
| `ID` | NUMBER |
| `CITY` | VARCHAR2(21) |
| `STATE` | VARCHAR2(2) |
| `LAT_N` | NUMBER |
| `LONG_W` | NUMBER |

where `LAT_N` is the northern latitude and `LONG_W` is the western longitude.

---

### MySQL Query

```sql
SELECT ROUND((MAX(LAT_N) - MIN(LAT_N)) + (MAX(LONG_W) - MIN(LONG_W)), 4)
FROM STATION;
```
