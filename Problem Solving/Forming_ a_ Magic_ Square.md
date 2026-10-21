# Forming a Magic Square

We define a magic square to be an $n \times n$ matrix of distinct positive integers from $1$ to $n^2$ where the sum of any row, column, or diagonal of length $n$ is always equal to the same number: the magic constant.

You will be given a $3 \times 3$ matrix $s$ of integers in the inclusive range $[1, 9]$. We can convert any digit $a$ to any other digit $b$ in the range $[1, 9]$ at a cost of $\vert{}a - b\vert{}$. Given $s$, convert it into a magic square at minimal cost. Print this cost on a new line.

**Note:** The resulting magic square must contain distinct integers in the inclusive range $[1, 9]$.

---

### Example
$$s = \begin{bmatrix} 5 & 3 & 4 \\ 1 & 5 & 8 \\ 6 & 4 & 2 \end{bmatrix}$$

We can convert it to the following magic square:
$$\begin{bmatrix} 8 & 3 & 4 \\ 1 & 5 & 9 \\ 6 & 7 & 2 \end{bmatrix}$$

The replacements:
- $\vert{}5 - 8\vert{} = 3$
- $\vert{}8 - 9\vert{} = 1$
- $\vert{}4 - 7\vert{} = 3$

Total cost: $3 + 1 + 3 = 7$.

---

### Function Description
Complete the `formingMagicSquare` function below.

`formingMagicSquare` has the following parameter(s):
- `int s[3][3]`: a $3 \times 3$ array of integers

**Returns:**
- `int`: the minimal total cost of converting the input square to a magic square.

---

### Constraints
- $s[i][j] \in [1, 9]$ for all $i, j \in [0, 2]$.

---

### Sample Test Cases

#### Sample Input 0
```text
4 9 2
3 5 7
8 1 5
```

#### Sample Output 0
```text
1
```
*Explanation:* Change the bottom right value from $5$ to $6$ at a cost of $\vert{}5 - 6\vert{} = 1$.

#### Sample Input 1
```text
4 8 2
4 5 7
6 1 6
```

#### Sample Output 1
```text
4
```

---

### Python 3 Solution

> **Ý tưởng:** Với ma trận $3 \times 3$ chứa các số từ $1$ đến $9$, chỉ tồn tại duy nhất **8 ma trận ma thuật (magic squares)** (tạo bởi các phép xoay và lật từ một ma trận chuẩn có tâm luôn là 5). Ta tính chi phí biến đổi ma trận đầu vào thành từng ma trận trong số 8 ma trận này và lấy giá trị nhỏ nhất.

```python
import os
import sys

def formingMagicSquare(s):
    # Tất cả 8 ma trận ma thuật 3x3 có thể có
    all_magic_squares = [
        [[8, 1, 6], [3, 5, 7], [4, 9, 2]],
        [[6, 1, 8], [7, 5, 3], [2, 9, 4]],
        [[4, 9, 2], [3, 5, 7], [8, 1, 6]],
        [[2, 9, 4], [7, 5, 3], [6, 1, 8]],
        [[8, 3, 4], [1, 5, 9], [6, 7, 2]],
        [[4, 3, 8], [9, 5, 1], [2, 7, 6]],
        [[6, 7, 2], [1, 5, 9], [8, 3, 4]],
        [[2, 7, 6], [9, 5, 1], [4, 3, 8]]
    ]
    
    min_cost = float('inf')
    
    # Tính chi phí biến đổi cho từng ma trận ma thuật
    for magic in all_magic_squares:
        cost = 0
        for i in range(3):
            for j in range(3):
                cost += abs(s[i][j] - magic[i][j])
        min_cost = min(min_cost, cost)
        
    return min_cost

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    s = []
    for _ in range(3):
        s.append(list(map(int, input().rstrip().split())))

    result = formingMagicSquare(s)
    fptr.write(str(result) + '\n')

    fptr.close()
```
