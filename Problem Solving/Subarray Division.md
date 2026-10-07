# Subarray Division (The Birthday Bar)

Two children, Lily and Ron, want to share a chocolate bar. Each of the squares has an integer on it.

Lily decides to share a contiguous segment of the bar selected such that:
- The length of the segment matches Ron's birth month ($m$).
- The sum of the integers on the squares is equal to his birth day ($d$).

Determine how many ways she can divide the chocolate.

---

### Function Description

Complete the `birthday` function in the editor below.

`birthday` has the following parameter(s):
- `s`: an array of integers representing the numbers on each square of chocolate
- `d`: an integer representing Ron's birth day (target sum)
- `m`: an integer representing Ron's birth month (segment length)

**Returns:**
- `int`: the number of ways the bar can be divided

---

### Input & Output Format

- **Input:**
  - The first line contains an integer $n$, the number of squares in the chocolate bar.
  - The second line contains $n$ space-separated integers describing $s$.
  - The third line contains two space-separated integers, $d$ and $m$.
- **Output:**
  - Print the number of valid contiguous segments.

---

### Sample Tests

| Input | Output | Explanation |
| :--- | :--- | :--- |
| `5`<br>`1 2 1 3 2`<br>`3 2` | `2` | Segments of length $m = 2$ summing to $d = 3$: `[1, 2]` at index 0 and `[2, 1]` at index 1. |
| `6`<br>`1 1 1 1 1 1`<br>`3 2` | `0` | Any segment of length 2 sums to $1 + 1 = 2 \neq 3$. |
| `1`<br>`4`<br>`4 1` | `1` | A single segment `[4]` of length 1 sums to 4. |

---

### Solution (Python 3)

```python
import sys

def birthday(s, d, m):
    count = 0
    # Slide a window of length m across the list
    for i in range(len(s) - m + 1):
        if sum(s[i:i + m]) == d:
            count += 1
    return count

if __name__ == '__main__':
    n = int(input().strip())
    s = list(map(int, input().rstrip().split()))
    d, m = map(int, input().rstrip().split())

    result = birthday(s, d, m)
    print(result)
