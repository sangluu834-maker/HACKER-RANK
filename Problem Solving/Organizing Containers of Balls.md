# Organizing Containers of Balls

David has several containers, each with a number of balls in it. He has just enough containers to sort each type of ball he has into its own container. David wants to sort the balls using his sort method.

David wants to perform some number of swap operations such that:
- Each container contains only balls of the same type.
- No two balls of the same type are located in different containers.

In a single operation, David can swap two balls located in different containers.

You must perform $q$ queries where each query is in the form of a matrix, $M$. For each query, print `Possible` on a new line if David can satisfy the conditions above for the given matrix. Otherwise, print `Impossible`.

---

### Example
- $n = 2$
- $\text{container} = [[1, 4], [2, 3]]$

David has $2$ containers and $2$ different types of balls.
- Container $0$ has $5$ balls ($1$ of type $0$, $4$ of type $1$).
- Container $1$ has $5$ balls ($2$ of type $0$, $3$ of type $1$).
- Total balls of type $0$: $1 + 2 = 3$.
- Total balls of type $1$: $4 + 3 = 7$.

Since swap operations do not change the total number of balls inside any container, no container has capacity $3$ or $7$. Thus, return `Impossible`.

---

### Function Description
Complete the `organizingContainers` function below.

`organizingContainers` has the following parameter(s):
- `int container[n][n]`: a two-dimensional array of integers that represent the number of balls of each color in each container

**Returns:**
- `string`: either `'Possible'` or `'Impossible'`.

---

### Input Format
- The first line contains an integer $q$, the number of queries.
- Each of the next $q$ sets of lines is as follows:
  1. The first line contains an integer $n$, the number of containers (rows) and ball types (columns).
  2. Each of the next $n$ lines contains $n$ space-separated integers describing row $M[i]$.

### Constraints
- $1 \le q \le 10$
- $1 \le n \le 100$
- $0 \le \text{container}[i][j] \le 10^9$

---

### Sample Test Cases

#### Sample Input 0
```text
2
2
1 1
1 1
2
0 2
1 1
```

#### Sample Output 0
```text
Possible
Impossible
```

**Explanation 0:**
- Query 1: Container capacities are $[2, 2]$ and total balls of each type are $[2, 2]$. They match $\rightarrow$ `Possible`.
- Query 2: Container capacities are $[2, 2]$ and total balls of each type are $[1, 3]$. They do not match $\rightarrow$ `Impossible`.

#### Sample Input 1
```text
2
3
1 3 1
2 1 2
3 3 3
3
0 2 1
1 1 1
2 0 0
```

#### Sample Output 1
```text
Impossible
Possible
```

---

### Python 3 Solution

> **Ý tưởng bất biến (Invariant):**
> - Mỗi phép hoán đổi lấy 1 quả bóng từ hộp A sang hộp B và trả lại 1 quả bóng từ hộp B sang hộp A. Do đó, **tổng số bóng trong mỗi hộp (sức chứa của từng hộp) không bao giờ thay đổi** sau bất kỳ số lần hoán đổi nào.
> - Để mỗi hộp chỉ chứa duy nhất 1 loại bóng và mỗi loại bóng chỉ nằm trong 1 hộp, thì **tập hợp sức chứa của các hộp** (tổng các hàng) phải khớp hoàn toàn (1-1) với **tập hợp tổng số lượng bóng của từng loại** (tổng các cột).
> - Ta chỉ cần tính tổng từng hàng (`row_sums`), tổng từng cột (`col_sums`), sắp xếp cả hai danh sách và kiểm tra xem chúng có bằng nhau hay không. Độ phức tạp thời gian: $O(n^2)$.

```python
import os
import sys

def organizingContainers(container):
    n = len(container)
    
    # Tổng số bóng trong mỗi hộp (tổng từng hàng)
    row_sums = [sum(row) for row in container]
    
    # Tổng số bóng của từng loại màu (tổng từng cột)
    col_sums = [sum(container[i][j] for i in range(n)) for j in range(n)]
    
    # Sắp xếp và đối chiếu 1-1
    if sorted(row_sums) == sorted(col_sums):
        return "Possible"
    return "Impossible"

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    q = int(input().strip())

    for q_itr in range(q):
        n = int(input().strip())

        container = []

        for _ in range(n):
            container.append(list(map(int, input().rstrip().split())))

        result = organizingContainers(container)

        fptr.write(result + '\n')

    fptr.close()
```
