# Number Line Jumps (Kangaroo)

You are choreographing a circus show with two kangaroos on a number line jumping toward positive infinity.

- Kangaroo 1 starts at location $x_1$ and moves at a rate of $v_1$ meters per jump.
- Kangaroo 2 starts at location $x_2$ and moves at a rate of $v_2$ meters per jump.

Determine if both kangaroos can land on the same location at the same time after an equal number of jumps. If possible, return `YES`; otherwise, return `NO`.

---

### Function Description

Complete the `kangaroo` function in the editor below.

`kangaroo` has the following parameter(s):
- `x1`, `v1`: starting position and jump distance for kangaroo 1
- `x2`, `v2`: starting position and jump distance for kangaroo 2

**Returns:**
- `string`: either `"YES"` or `"NO"`

---

### Input & Output Format

- **Input:**
  - A single line containing four space-separated integers denoting $x_1, v_1, x_2, v_2$.
- **Output:**
  - Print `YES` if they meet at the same point after the same number of jumps; otherwise, print `NO`.

---

### Sample Tests

| Input | Output | Explanation |
| :--- | :--- | :--- |
| `0 3 4 2` | `YES` | After 4 jumps, both kangaroos land at position 12 ($0 + 4 \times 3 = 12$ and $4 + 4 \times 2 = 12$). |
| `0 2 5 3` | `NO` | Kangaroo 2 starts ahead and jumps faster ($v_2 > v_1$), so kangaroo 1 can never catch up. |

---

### Solution (Python 3)

```python
import sys

def kangaroo(x1, v1, x2, v2):
    # Kangaroo 1 must jump faster than Kangaroo 2 to catch up,
    # and the distance between them must divide evenly by the speed difference.
    if v1 > v2 and (x2 - x1) % (v1 - v2) == 0:
        return "YES"
    return "NO"

if __name__ == '__main__':
    x1, v1, x2, v2 = map(int, input().rstrip().split())
    result = kangaroo(x1, v1, x2, v2)
    print(result)
