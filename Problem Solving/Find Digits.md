# Find Digits

An integer $d$ is a divisor of an integer $n$ if the remainder of $n / d = 0$.

Given an integer, for each digit that makes up the integer determine whether it is a divisor. Count the number of divisors occurring within the integer.

**Note:** Division by zero is undefined, so digits equal to $0$ are never considered divisors.

---

### Example
- $n = 124$:
  Digits are $1, 2, 4$.
  - $124 \pmod 1 = 0$
  - $124 \pmod 2 = 0$
  - $124 \pmod 4 = 0$
  All $3$ digits divide evenly into $124 \rightarrow$ return `3`.

- $n = 111$:
  Digits are $1, 1, 1$.
  All $3$ divide evenly into $111 \rightarrow$ return `3`.

- $n = 10$:
  Digits are $1, 0$.
  $1$ divides evenly, but $0$ cannot divide $10 \rightarrow$ return `1`.

---

### Function Description
Complete the `findDigits` function below.

`findDigits` has the following parameter(s):
- `int n`: the value to analyze

**Returns:**
- `int`: the number of digits in $n$ that are divisors of $n$.

---

### Input Format
- The first line is an integer, $t$, the number of test cases.
- The $t$ subsequent lines each contain an integer, $n$.

### Constraints
- $1 \le t \le 15$
- $0 < n < 10^9$

---

### Sample Test Cases

#### Sample Input
```text
2
12
1012
```

#### Sample Output
```text
2
3
```

**Explanation:**
- The number $12$ consists of digits $1$ and $2$. Both divide $12$ evenly $\rightarrow 2$.
- The number $1012$ consists of digits $1, 0, 1, 2$. Digits $1, 1,$ and $2$ divide $1012$ evenly, whereas $0$ is skipped $\rightarrow 3$.

---

### Python 3 Solution

> **Ý tưởng:**
> - Chuyển $n$ thành chuỗi để duyệt qua từng ký tự chữ số.
> - Bỏ qua nếu chữ số là `'0'`.
> - Chuyển ký tự thành số nguyên `d = int(ch)`, kiểm tra nếu `n % d == 0` thì tăng biến đếm.

```python
import os
import sys

def findDigits(n):
    count = 0
    for ch in str(n):
        digit = int(ch)
        if digit != 0 and n % digit == 0:
            count += 1
    return count

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    t = int(input().strip())

    for t_itr in range(t):
        n = int(input().strip())

        result = findDigits(n)

        fptr.write(str(result) + '\n')

    fptr.close()
```
