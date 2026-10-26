# Extra Long Factorials

The factorial of the integer $n$, written $n!$, is defined as:
$$n! = n \times (n - 1) \times (n - 2) \times \dots \times 3 \times 2 \times 1$$

Calculate and print the factorial of a given integer.

For example, if $n = 30$, we calculate $30 \times 29 \times 28 \times \dots \times 2 \times 1$ and get:
$$265252859812191058636308480000000$$

**Note:** Factorials of $n > 20$ can't be stored even in a $64$-bit integer variable. Python natively supports arbitrarily large integers (bignum arithmetic), so no special data structure is required.

---

### Function Description
Complete the `extraLongFactorials` function below. It should print the result and return.

`extraLongFactorials` has the following parameter(s):
- `int n`: an integer

**Print:**
- Print the factorial of $n$.

---

### Input Format
Input consists of a single integer $n$.

### Constraints
- $1 \le n \le 100$

---

### Sample Test Cases

#### Sample Input
```text
25
```

#### Sample Output
```text
15511210043330985984000000
```

---

### Python 3 Solution

> **Ý tưởng:** 
> - Python 3 tự động xử lý số nguyên có độ dài tùy ý mà không bị tràn bộ nhớ.
> - Ta có thể sử dụng hàm `math.factorial(n)` có sẵn của Python hoặc vòng lặp tích lũy đơn giản, sau đó in kết quả trực tiếp ra màn hình.

```python
import math
import os
import sys

def extraLongFactorials(n):
    # Python hỗ trợ số nguyên lớn tùy ý (Arbitrary-precision arithmetic)
    print(math.factorial(n))

if __name__ == '__main__':
    n = int(input().strip())

    extraLongFactorials(n)
```
