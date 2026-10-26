# Library Fine

Your local library needs your help! Given the expected and actual return dates for a library book, create a program that calculates the fine (if any). The fee structure is as follows:

1. If the book is returned on or before the expected return date, no fine will be charged:
   $$\text{fine} = 0$$
2. If the book is returned after the expected return day but still within the same calendar month and year as the expected return date:
   $$\text{fine} = 15 \times (d_1 - d_2)$$
3. If the book is returned after the expected return month but still within the same calendar year as the expected return date:
   $$\text{fine} = 500 \times (m_1 - m_2)$$
4. If the book is returned after the calendar year in which it was expected, there is a fixed fine of:
   $$\text{fine} = 10000$$

Charges are based only on the least precise measure of lateness.

---

### Example
- Returned: $d_1 = 14, m_1 = 7, y_1 = 2018$
- Due: $d_2 = 5, m_2 = 7, y_2 = 2018$

The years and months are the same. The book is $14 - 5 = 9$ days late.
$$\text{fine} = 15 \times 9 = 135$$

---

### Function Description
Complete the `libraryFine` function below.

`libraryFine` has the following parameter(s):
- `int d1, m1, y1`: returned date day, month, and year
- `int d2, m2, y2`: due date day, month, and year

**Returns:**
- `int`: the amount of the fine or $0$ if there is none.

---

### Input Format
- The first line contains $3$ space-separated integers, $d_1, m_1, y_1$, denoting the actual return date.
- The second line contains $3$ space-separated integers, $d_2, m_2, y_2$, denoting the expected due date.

### Constraints
- $1 \le d_1, d_2 \le 31$
- $1 \le m_1, m_2 \le 12$
- $1 \le y_1, y_2 \le 3000$
- It is guaranteed that the dates will be valid Gregorian calendar dates.

---

### Sample Test Cases

#### Sample Input
```text
9 6 2015
6 6 2015
```

#### Sample Output
```text
45
```

**Explanation:**
- $y_1 = y_2 = 2015$ (same year)
- $m_1 = m_2 = 6$ (same month)
- $d_1 = 9 > d_2 = 6 \implies (9 - 6) \times 15 = 45$

---

### Python 3 Solution

> **Ý tưởng:**
> Kiểm tra các mốc thời gian theo thứ tự từ đơn vị lớn nhất (năm) đến nhỏ nhất (ngày):
> 1. Nếu $y_1 < y_2$: Trả sách trước năm dự kiến $\rightarrow \text{fine} = 0$.
> 2. Nếu $y_1 > y_2$: Tr
