# Simple Array Sum

Given an array of integers, find the sum of its elements.

For example, if the array $ar = [1, 2, 3]$, $1 + 2 + 3 = 6$, so return $6$.

---

### Function Description

Complete the `simpleArraySum` function with the following parameter(s):
- `ar`: an array of integers

**Returns:**
- `int`: the sum of the array elements

---

### Input & Output Format

- **Input:**
  - The first line contains an integer $n$, denoting the size of the array.
  - The second line contains $n$ space-separated integers representing the array's elements.
- **Output:**
  - Print the sum of the array's elements as a single integer.

---

### Sample Test

| Input | Output | Explanation |
| :--- | :--- | :--- |
| `6`<br>`1 2 3 4 10 11` | `31` | $1 + 2 + 3 + 4 + 10 + 11 = 31$ |

---

### Solution (Python 3)

```python
import sys

def simpleArraySum(ar):
    return sum(ar)

if __name__ == '__main__':
    n = int(input().strip())
    ar = list(map(int, input().rstrip().split()))
    print(simpleArraySum(ar))
