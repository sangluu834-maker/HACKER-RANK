# Sherlock and Squares

Watson likes to challenge Sherlock's math ability. He will provide a starting and ending value that describe a range of integers, inclusive of the endpoints. Sherlock must determine the number of square integers within that range.

**Note:** A square integer is an integer which is the square of an integer, e.g. $1, 4, 9, 16, \dots$.

---

### Example
- $a = 24$
- $b = 49$

There are three square integers in the range $[24, 49]$: $25$, $36$, and $49$. Return `3`.

---

### Function Description
Complete the `squares` function below.

`squares` has the following parameter(s):
- `int a`: the lower range boundary
- `int b`: the upper range boundary

**Returns:**
- `int`: the number of square integers in the range.

---

### Input Format
- The first line contains $q$, the number of test cases.
- Each of the next $q$ lines contains two space-separated integers, $a$ and $b$, the starting and ending integers in the ranges.

### Constraints
- $1 \le q \le 100$
- $1 \le a \le b \le 10^9$

---

### Sample Test Cases

#### Sample Input
```text
2
3 9
17 24
```

#### Sample Output
```text
2
0
```

**Explanation:**
- Test Case 0: In range $[3, 9]$, $4$ and $9$ are the two square integers $\rightarrow 2$.
- Test Case 1: In range $[17, 24]$, there are no square integers $\rightarrow 0$.

---

### Python 3 Solution

> **Ý tưởng:**
> Ta cần đếm số lượng số nguyên $x$ sao cho:
> $$a \le x^2 \le b \iff \sqrt{a} \le x \le \sqrt{b}$$
> - Vì $x$ là số nguyên, cận dưới hợp lệ nhỏ nhất là $\lceil\sqrt{a}\rceil = \text{math.ceil}(\sqrt{a})$.
> - Cận trên hợp lệ lớn nhất là $\lfloor\sqrt{b}\rfloor = \text{math.floor}(\sqrt{b})$.
> - Số lượng số nguyên thỏa mãn trong đoạn $[\lceil\sqrt{a}\rceil, \lfloor\sqrt{b}\rfloor]$ chính là:
>   $$\lfloor\sqrt{b}\rfloor - \lceil\sqrt{a}\rceil + 1$$
> - Nếu giá trị tính được nhỏ hơn 0 thì trả về 0. Độ phức tạp là $O(1)$ cho mỗi test case.

```python
import math
import os
import sys

def squares(a, b):
    # Căn bậc hai cận dưới làm tròn lên
    lower = math.ceil(math.sqrt(a))
    # Căn bậc hai cận trên làm tròn xuống
    upper = math.floor(math.sqrt(b))
    
    # Số lượng số chính phương trong đoạn [a, b]
    return max(0, upper - lower + 1)

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    q = int(input().strip())

    for q_itr in range(q):
        first_multiple_input = input().rstrip().split()

        a = int(first_multiple_input[0])
        b = int(first_multiple_input[1])

        result = squares(a, b)

        fptr.write(str(result) + '\n')

    fptr.close()
```
