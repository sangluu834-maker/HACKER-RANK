# Repeated String

There is a string, $s$, of lowercase English letters that is repeated infinitely many times. Given an integer, $n$, find and print the number of letter 'a's in the first $n$ letters of the infinite string.

---

### Example
- $s = \text{"abcac"}$
- $n = 10$

The substring we consider is $\text{"abcacabcac"}$, the first $10$ characters of the infinite string. There are $4$ occurrences of `'a'` in this substring $\rightarrow$ return `4`.

---

### Function Description
Complete the `repeatedString` function below.

`repeatedString` has the following parameter(s):
- `string s`: a string to repeat
- `int n`: the number of characters to consider

**Returns:**
- `int`: the frequency of `'a'` in the prefix of length $n$.

---

### Input Format
- The first line contains a single string, $s$.
- The second line contains an integer, $n$.

### Constraints
- $1 \le \vert{}s\vert{} \le 100$
- $1 \le n \le 10^{12}$
- For $25\%$ of the test cases, $n \le 10^6$.

---

### Sample Test Cases

#### Sample Input 0
```text
aba
10
```

#### Sample Output 0
```text
7
```

**Explanation:**
The first $10$ letters are `abaabaabaa`. There are $7$ occurrences of `'a'`.

#### Sample Input 1
```text
a
1000000000000
```

#### Sample Output 1
```text
1000000000000
```

---

### Python 3 Solution

> **Ý tưởng:**
> Vì $n \le 10^{12}$, ta không thể tạo chuỗi độ dài $n$ vì sẽ tràn bộ nhớ (Memory Limit Exceeded). Thay vào đó, ta tính toán theo công thức toán học $O(\vert{}s\vert{})$:
> 1. Đếm số ký tự `'a'` có trong một chuỗi mẫu $s$: `count_in_s = s.count('a')`.
> 2. Chuỗi $s$ lặp lại hoàn chỉnh số lần là: `full_repeats = n // len(s)`.
> 3. Số ký tự còn dư ở cuối sau các chuỗi hoàn chỉnh là: `remainder = n % len(s)`.
> 4. Đếm số ký tự `'a'` trong đoạn dư đầu tiên này: `s[:remainder].count('a')`.
> 5. Tổng số lượng chữ `'a'` là:
>    $$\text{Total} = (\text{full\_repeats} \times \text{count\_in\_s}) + s[:\text{remainder}].\text{count}('a')$$

```python
import os
import sys

def repeatedString(s, n):
    # Đếm số lượng 'a' trong một chuỗi s hoàn chỉnh
    count_in_single = s.count('a')
    
    # Số chuỗi s lặp lại nguyên vẹn
    full_repeats = n // len(s)
    
    # Số ký tự dư ra ở chuỗi cuối cùng
    remainder = n % len(s)
    
    # Đếm số 'a' trong phần dư đó
    count_in_remainder = s[:remainder].count('a')
    
    # Tổng số ký tự 'a'
    return (full_repeats * count_in_single) + count_in_remainder

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    s = input()
    n = int(input().strip())

    result = repeatedString(s, n)

    fptr.write(str(result) + '\n')
    fptr.close()
```
