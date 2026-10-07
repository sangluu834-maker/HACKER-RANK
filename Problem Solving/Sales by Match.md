# Sales by Match (Sock Merchant)

There is a large pile of socks that must be paired by color. Given an array of integers representing the color of each sock, determine how many pairs of socks with matching colors there are.

For example, given $ar = [1, 2, 1, 2, 1, 3, 2]$, there is one pair of color $1$ and one pair of color $2$. There are three odd socks left, so the number of matching pairs is $2$.

---

### Function Description

Complete the `sockMerchant` function in the editor below.

`sockMerchant` has the following parameter(s):
- `n`: the number of socks in the pile
- `ar`: an array of integers representing the color of each sock

**Returns:**
- `int`: the total number of matching pairs of socks

---

### Input & Output Format

- **Input:**
  - The first line contains an integer $n$, the number of socks.
  - The second line contains $n$ space-separated integers describing `ar`.
- **Output:**
  - Print the total number of pairs of matching socks.

---

### Sample Test

| Input | Output | Explanation |
| :--- | :--- | :--- |
| `9`<br>`10 20 20 10 10 30 50 10 20` | `3` | There are 4 socks of color 10 (2 pairs), 3 socks of color 20 (1 pair), 1 of color 30, and 1 of color 50. Total: $2 + 1 = 3$ pairs. |

---

### Solution (Python 3)

```python
import sys
from collections import Counter

def sockMerchant(n, ar):
    color_counts = Counter(ar)
    return sum(count // 2 for count in color_counts.values())

if __name__ == '__main__':
    n = int(input().strip())
    ar = list(map(int, input().rstrip().split()))

    result = sockMerchant(n, ar)
    print(result)
