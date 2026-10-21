# The Hurdle Race

A video player plays a game in which the character competes in a hurdle race. Hurdles are of varying heights, and the characters have a maximum height they can jump. There is a magic potion they can take that will increase their maximum jump height by $1$ unit for each dose. How many doses of the potion must the character take to be able to jump all of the hurdles? If the character can already clear all of the hurdles, return $0$.

---

### Example
- $k = 4$
- $height = [1, 6, 3, 5, 2]$

The character can naturally jump $4$ units high. The tallest hurdle has a height of $6$. The character must take $6 - 4 = 2$ doses of potion to clear all hurdles. Return `2`.

---

### Function Description
Complete the `hurdleRace` function below.

`hurdleRace` has the following parameter(s):
- `int k`: the height the character can jump naturally
- `int height[n]`: the heights of each hurdle

**Returns:**
- `int`: the minimum number of doses required, always $0$ or more.

---

### Input Format
- The first line contains two space-separated integers $n$ and $k$, the number of hurdles and the maximum height the character can jump naturally.
- The second line contains $n$ space-separated integers $height[i]$ where $0 \le i < n$.

### Constraints
- $1 \le n, k \le 100$
- $1 \le height[i] \le 100$

---

### Sample Test Cases

#### Sample Input 0
```text
5 4
1 6 3 5 2
```

#### Sample Output 0
```text
2
```
*Explanation:* The character can jump a maximum of $4$ units, but the tallest hurdle has a height of $6$. Dan must drink $6 - 4 = 2$ doses.

#### Sample Input 1
```text
5 7
2 5 4 5 2
```

#### Sample Output 1
```text
0
```
*Explanation:* Dan's character can jump $7$ units, which is higher than the tallest hurdle ($5$). No doses are required, return $0$.

---

### Python 3 Solution

> **Ý tưởng:** Tìm chướng ngại vật cao nhất trong mảng bằng hàm `max(height)`. Số liều thuốc cần uống chính là $\max(0, \max(height) - k)$.

```python
import os
import sys

def hurdleRace(k, height):
    tallest = max(height)
    return max(0, tallest - k)

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    first_multiple_input = input().rstrip().split()
    n = int(first_multiple_input[0])
    k = int(first_multiple_input[1])

    height = list(map(int, input().rstrip().split()))

    result = hurdleRace(k, height)

    fptr.write(str(result) + '\n')
    fptr.close()
```
