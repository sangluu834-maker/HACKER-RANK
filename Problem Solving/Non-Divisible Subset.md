# Non-Divisible Subset

Given a set of distinct integers, print the size of a maximal subset of $S$ where the sum of any $2$ numbers in $S'$ is not evenly divisible by $k$.

---

### Example
- $S = [19, 10, 12, 10, 24, 25, 22]$
- $k = 4$

One valid subset is $S' = [10, 12, 25]$:
- $10 + 12 = 22$ (not divisible by $4$)
- $10 + 25 = 35$ (not divisible by $4$)
- $12 + 25 = 37$ (not divisible by $4$)

The maximum length subset that meets the criteria has $3$ elements.

---

### Function Description
Complete the `nonDivisibleSubset` function below.

`nonDivisibleSubset` has the following parameter(s):
- `int k`: the divisor
- `int s[n]`: an array of distinct integers

**Returns:**
- `int`: the length of the longest subset of $S$ meeting the criteria.

---

### Input Format
- The first line contains $2$ space-separated integers, $n$ and $k$, the number of values in $S$ and the non-factor.
- The second line contains $n$ space-separated integers, each representing an element of $S$.

### Constraints
- $1 \le n \le 10^5$
- $1 \le k \le 100$
- $1 \le S[i] \le 10^9$
- All elements of $S$ are distinct.

---

### Sample Test Cases

#### Sample Input
```text
4 3
1 7 2 4
```

#### Sample Output
```text
3
```

**Explanation:**
- Modulo $3$ values:
  - $1 \pmod 3 = 1$
  - $7 \pmod 3 = 1$
  - $4 \pmod 3 = 1$
  - $2 \pmod 3 = 2$
- Group with remainder $1$ has size $3$ (`[1, 7, 4]`).
- Group with remainder $2$ has size $1$ (`[2]`).
- Picking elements with remainder $1$ and remainder $2$ will sum to a multiple of $3$ ($1 + 2 = 3$). We pick the larger group (size $3$).
- The maximum subset is $\{1, 7, 4\}$ with size $3$.

---

### Python 3 Solution

> **Ý tưởng:**
> 1. Hai số $a$ và $b$ có tổng chia hết cho $k$ khi và chỉ khi:
>    $$(a \pmod k + b \pmod k) \pmod k = 0$$
> 2. Đếm tần suất xuất hiện của các số theo phần dư khi chia cho $k$, lưu vào mảng `remainder_counts` kích thước $k$.
> 3. Các cặp phần dư bù nhau $(r, k - r)$ có tổng chia hết cho $k$:
>    - Ta chỉ có thể chọn các số từ nhóm $r$ **hoặc** nhóm $k - r$, không thể chọn cả hai. Để tối đa hóa kích thước tập con, ta lấy $\max(\text{count}[r], \text{count}[k - r])$.
> 4. **Trường hợp đặc biệt 1 ($r = 0$):**
>    - Tổng hai số có phần dư $0$ sẽ chia hết cho $k$. Do đó ta chỉ có thể chọn **tối đa 1** số có phần dư $0$ (nếu có).
> 5. **Trường hợp đặc biệt 2 ($k$ là số chẵn và $r = k / 2$):**
>    - Hai số có cùng phần dư $k / 2$ cộng lại sẽ bằng $k$ (chia hết cho $k$). Do đó ta cũng chỉ có thể chọn **tối đa 1** số từ nhóm này (nếu có).

```python
import os
import sys

def nonDivisibleSubset(k, s):
    # Đếm số lượng phần tử theo phần dư khi chia cho k
    remainder_counts = [0] * k
    for x in s:
        remainder_counts[x % k] += 1
        
    # Trường hợp r = 0: chỉ lấy tối đa 1 phần tử
    count = min(remainder_counts[0], 1)
    
    # Duyệt qua các cặp phần dư bù nhau (r, k - r)
    for r in range(1, (k // 2) + 1):
        if r == k - r:
            # Trường hợp k là số chẵn và r == k / 2: chỉ lấy tối đa 1 phần tử
            count += min(remainder_counts[r], 1)
        else:
            # Chọn nhóm có số lượng phần tử lớn hơn
            count += max(remainder_counts[r], remainder_counts[k - r])
            
    return count

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    first_multiple_input = input().rstrip().split()

    n = int(first_multiple_input[0])
    k = int(first_multiple_input[1])

    s = list(map(int, input().rstrip().split()))

    result = nonDivisibleSubset(k, s)

    fptr.write(str(result) + '\n')
    fptr.close()
```
