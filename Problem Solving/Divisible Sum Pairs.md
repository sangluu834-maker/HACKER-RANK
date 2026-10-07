# Divisible Sum Pairs

Given an array of integers and a positive integer $k$, determine the number of pairs $(i, j)$ where $i < j$ and $ar[i] + ar[j]$ is divisible by $k$.

---

### Function Description

Complete the `divisibleSumPairs` function in the editor below.

`divisibleSumPairs` has the following parameter(s):
- `n`: the length of array $ar$
- `k`: the integer divisor
- `ar`: an array of integers

**Returns:**
- `int`: the number of pairs $(i, j)$ where $(ar[i] + ar[j]) \pmod k = 0$.

---

### Sample Test

| Input | Output | Explanation |
| :--- | :--- | :--- |
| `6 3`<br>`1 3 2 6 1 2` | `5` | Valid pairs: $(0,2) \to 1+2=3$, $(0,5) \to 1+2=3$, $(1,3) \to 3+6=9$, $(2,4) \to 2+1=3$, $(4,5) \to 1+2=3$. |

---

### Solution (Python 3)

```python
import sys

def divisibleSumPairs(n, k, ar):
    count = 0
    for i in range(n):
        for j in range(i + 1, n):
            if (ar[i] + ar[j]) % k == 0:
                count += 1
    return count

if __name__ == '__main__':
    first_line = input().rstrip().split()
    n = int(first_line[0])
    k = int(first_line[1])

    ar = list(map(int, input().rstrip().split()))
    result = divisibleSumPairs(n, k, ar)
    print(result)
