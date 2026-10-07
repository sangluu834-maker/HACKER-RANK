# Solve Me First

Complete the function to compute the sum of two integers.

---

### Function Description

Complete the `solveMeFirst` function with the following parameters:
- `a`: the first integer
- `b`: the second integer

**Returns:**
- `int`: the sum of `a` and `b`

---

### Input & Output Format

- **Input:**
  - The first line contains the first integer `a`.
  - The second line contains the second integer `b`.
- **Output:**
  - Print the sum of `a` and `b`.

---

### Sample Test

| Input | Output | Explanation |
| :--- | :--- | :--- |
| `2`<br>`3` | `5` | $2 + 3 = 5$ |

---

### Solution (Python 3)

```python
def solveMeFirst(a, b):
    return a + b

if __name__ == '__main__':
    num1 = int(input().strip())
    num2 = int(input().strip())
    res = solveMeFirst(num1, num2)
    print(res)
