# Staircase

Print a right-aligned staircase of size $n$ using `#` symbols and spaces.

---

### Function Description

Complete the `staircase` function in the editor below.

`staircase` has the following parameter:
- `n`: an integer denoting the size of the staircase ($0 < n \le 100$)

**Print:**
- Print a right-aligned staircase of base and height equal to $n$. The last line is not preceded by any spaces. No value should be returned.

---

### Input & Output Format

- **Input:**
  - A single integer $n$ denoting the size of the staircase.
- **Output:**
  - Print a staircase of size $n$ using `#` symbols and spaces.

---

### Sample Test

| Input | Output | Explanation |
| :--- | :--- | :--- |
| `6` | <pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#<br>&nbsp;&nbsp;&nbsp;&nbsp;##<br>&nbsp;&nbsp;&nbsp;###<br>&nbsp;&nbsp;####<br>&nbsp;#####<br>######</pre> | The staircase has a height and width of 6, right-aligned with `#` symbols. |

---

### Solution (Python 3)

```python
import sys

def staircase(n):
    for i in range(1, n + 1):
        print(" " * (n - i) + "#" * i)

if __name__ == '__main__':
    n = int(input().strip())
    staircase(n)
