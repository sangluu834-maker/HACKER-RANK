# Circular Array Rotation

John Watson knows of an operation called a right circular rotation on an array of integers. One rotation operation moves the last array element to the first position and shifts all remaining elements right one. To test Sherlock's abilities, Watson provides Sherlock with an array of integers. Sherlock is to perform the rotation operation a number of times then determine the value of the element at a given position.

For each array, perform a number of right circular rotations and return the values of the elements at the given indices.

---

### Example
- $a = [3, 4, 5]$
- $k = 2$
- $queries = [1, 2]$

Here $k$ is the number of rotations on $a$, and $queries$ holds the list of indices to report.
1. Initial: $[3, 4, 5]$
2. Rotation 1: $[5, 3, 4]$
3. Rotation 2: $[4, 5, 3]$

Now return the values from the zero-based indices $1$ and $2$:
- $a'[1] = 5$
- $a'[2] = 3$

The result is `[5, 3]`.

---

### Function Description
Complete the `circularArrayRotation` function below.

`circularArrayRotation` has the following parameter(s):
- `int a[n]`: the array to rotate
- `int k`: the rotation count
- `int queries[q]`: the indices to report

**Returns:**
- `int[q]`: the values in the rotated array as requested in `queries`.

---

### Input Format
- The first line contains $3$ space-separated integers, $n$, $k$, and $q$: the number of elements in $a$, the rotation count, and the number of queries.
- The second line contains $n$ space-separated integers describing array $a$.
- Each of the $q$ subsequent lines contains a single integer $m$, an index of an element in the rotated array to return.

### Constraints
- $1 \le n \le 10^5$
- $1 \le a[i] \le 10^5$
- $1 \le k \le 10^5$
- $1 \le q \le 500$
- $0 \le \text{queries}[i] < n$

---

### Sample Test Cases

#### Sample Input 0
```text
3 2 3
1 2 3
0
1
2
```

#### Sample Output 0
```text
2
3
1
```

**Explanation:**
After $2$ rotations, the array becomes $[2, 3, 1]$:
- At index $0 \rightarrow 2$
- At index $1 \rightarrow 3$
- At index $2 \rightarrow 1$

---

### Python 3 Solution

> **Ý tưởng:**
> - Nếu thực hiện xoay mảng thực tế $k$ lần, độ phức tạp sẽ là $O(k \times n)$, rất dễ bị TLE khi $k, n \le 10^5$.
> - Sau khi xoay sang phải $k$ lần, phần tử ban đầu ở vị trí `old_idx` sẽ chuyển sang vị trí `new_idx = (old_idx + k) % n`.
> - Do đó, với mỗi truy vấn cần lấy phần tử tại chỉ số `q_idx` trong mảng mới, vị trí ban đầu của nó trong mảng gốc là:
>   $$\text{old\_idx} = (q\_idx - k) \pmod n$$
> - Trả về `a[(q_idx - k) % n]` trong thời gian $O(1)$ cho mỗi query.

```python
import os
import sys

def circularArrayRotation(a, k, queries):
    n = len(a)
    # Rút gọn số lần xoay
    k = k % n
    
    # Tính trực tiếp chỉ số gốc trước khi xoay
    result = [a[(q - k) % n] for q in queries]
    return result

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    first_multiple_input = input().rstrip().split()

    n = int(first_multiple_input[0])
    k = int(first_multiple_input[1])
    q = int(first_multiple_input[2])

    a = list(map(int, input().rstrip().split()))

    queries = []
    for _ in range(q):
        queries_item = int(input().strip())
        queries.append(queries_item)

    result = circularArrayRotation(a, k, queries)

    fptr.write('\n'.join(map(str, result)))
    fptr.write('\n')

    fptr.close()
```
