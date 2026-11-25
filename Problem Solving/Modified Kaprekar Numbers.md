# Modified Kaprekar Numbers

A modified Kaprekar number is a positive whole number with a special property. If you square it, then split the number into two integers and sum those integers, you have the same value you started with.

Consider a positive whole number $n$ with $d$ digits. We square $n$ to arrive at a number that is either $2 \times d$ digits long or $(2 \times d) - 1$ digits long. Split the string representation of the square into two parts, $l$ and $r$. The right-hand part, $r$, must be $d$ digits long. The left is the remaining substring. Convert those two substrings back to integers, add them and see if you get $n$.

**Note:** $r$ may have leading zeros.

---

### Example
- $n = 5$, $d = 1$:
  $n^2 = 25 \rightarrow l = 2, r = 5 \implies 2 + 5 = 7 \ne 5$ (not a Kaprekar number).
- $n = 9$, $d = 1$:
  $n^2 = 81 \rightarrow l = 8, r = 1 \implies 8 + 1 = 9 = n$ (modified Kaprekar number).
- $n = 45$, $d = 2$:
  $n^2 = 2025 \rightarrow l = 20, r = 25 \implies 20 + 25 = 45 = n$ (modified Kaprekar number).

Given two positive integers $p$ and $q$ where $p$ is lower than $q$, write a program to print the modified Kaprekar numbers in the range between $p$ and $q$, inclusive. If no modified Kaprekar numbers exist in the given range, print `INVALID RANGE`.

---

### Function Description
Complete the `kaprekarNumbers` function below.

`kaprekarNumbers` has the following parameter(s):
- `int p`: the lower limit
- `int q`: the upper limit

**Prints:**
It should print the list of modified Kaprekar numbers, space-separated on one line and in ascending order. If no modified Kaprekar numbers exist in the given range, print `INVALID RANGE`. No return value is required.

---

### Input Format
- The first line contains the lower integer limit $p$.
- The second line contains the upper integer limit $q$.

### Constraints
- $0 < p < q < 100000$

---

### Sample Test Cases

#### Sample Input
```text
1
100
```

#### Sample Output
```text
1 9 45 55 99
```

**Explanation:**
$1, 9, 45, 55,$ and $99$ are the modified Kaprekar numbers in the range $[1, 100]$.

---

### Python 3 Solution

> **Ý tưởng:**
> - Duyệt qua từng số nguyên $n$ trong khoảng $[p, q]$.
> - Tìm số chữ số $d$ của $n$: `d = len(str(n))`.
> - Tính bình phương và chuyển thành chuỗi: `sq_str = str(n * n)`.
> - Tách phần bên phải $r$ có đúng $d$ chữ số cuối: `r = int(sq_str[-d:])`.
> - Phần bên trái $l$ là phần còn lại ở đầu (nếu chuỗi `sq_str[:-d]` rỗng, ví dụ trường hợp $n = 1 \implies 1^2 = 1$, thì $l = 0$): `l = int(sq_str[:-d]) if sq_str[:-d] else 0`.
> - Kiểm tra nếu `l + r == n` thì thêm $n$ vào danh sách kết quả. Cuối cùng in kết quả hoặc `"INVALID RANGE"` nếu danh sách rỗng.

```python
import math
import os
import random
import re
import sys

def kaprekarNumbers(p, q):
    result = []
    
    for n in range(p, q + 1):
        d = len(str(n))
        sq_str = str(n * n)
        
        # Phần bên phải r gồm đúng d chữ số cuối
        r = int(sq_str[-d:])
        
        # Phần bên trái l là các chữ số còn lại (bằng 0 nếu rỗng, vd: n = 1)
        left_str = sq_str[:-d]
        l = int(left_str) if left_str else 0
        
        if l + r == n:
            result.append(str(n))
            
    if result:
        print(" ".join(result))
    else:
        print("INVALID RANGE")

if __name__ == '__main__':
    p = int(input().strip())
    q = int(input().strip())

    kaprekarNumbers(p, q)
```
