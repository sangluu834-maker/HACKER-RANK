# Weather Observation Station 19

Consider $P_1(a, c)$ and $P_2(b, d)$ to be two points on a 2D plane:
- $a$ and $b$ are the respective minimum and maximum values of Northern Latitude (`LAT_N`) in **STATION** ($a = \min(\text{LAT\_N}), b = \max(\text{LAT\_N})$).
- $c$ and $d$ are the respective minimum and maximum values of Western Longitude (`LONG_W`) in **STATION** ($c = \min(\text{LONG\_W}), d = \max(\text{LONG\_W})$).

Query the Euclidean Distance between points $P_1$ and $P_2$ and format your answer to display $4$ decimal digits.

---

### Formula
The Euclidean Distance between two points $(x_1, y_1)$ and $(x_2, y_2)$ is:
$$\text{Distance} = \sqrt{(x_1 - x_2)^2 + (y_1 - y_2)^2} = \sqrt{(b - a)^2 + (d - c)^2}$$

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
SELECT ROUND(
    SQRT(
        POW(MAX(LAT_N) - MIN(LAT_N), 2) + 
        POW(MAX(LONG_W) - MIN(LONG_W), 2)
    ), 
    4
)
FROM STATION;
```
