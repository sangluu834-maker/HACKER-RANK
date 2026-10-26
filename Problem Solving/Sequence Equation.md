# Sequence Equation (Permutation Equation)

Given a sequence of $n$ integers, $p = [p[1], p[2], \dots, p[n]]$ where each element is distinct and satisfies $1 \le p[x] \le n$. For each $x$ where $1 \le x \le n$, find any integer $y$ such that $p(p(y)) = x$ and keep a history of the values of $y$ in a return array.

---

### Example
$p = [5, 2, 1, 3, 4]$ (1-based index)

For each $x$ from $1$ to $5$:
1. $x = 1$: $p[3] = 1$, and $p[4] = 3 \Rightarrow p[p[4]] = 1 \Rightarrow y = 4$
2. $x = 2$: $p[2] = 2$, and $p[2] = 2 \Rightarrow p[p[2]] = 2 \Rightarrow y = 2$
3. $x = 3$: $p[4] = 3$, and $p[5] = 4 \Rightarrow p[p[5]] = 3 \Rightarrow y = 5$
4. $x = 4$: $p[5] = 4$, and $p[1] = 5 \Rightarrow p[p[1]] = 4 \Rightarrow y = 1$
5. $x = 5$: $p[1] = 5$, and $p[3] = 1 \Rightarrow p[p[3]] = 5 \Rightarrow y = 3$

Result array: `[4, 2, 5, 1, 3]`.

---

### Function Description
Complete the `permutationEquation` function below.

`permutationEquation` has the following parameter(s):
- `int p[n]`: an array of integers

**Returns:**
- `int[n]`: the values of $y$ for all $x$ in the sequence $1$ to $n$.

---

### Input Format
- The first line contains an integer $n$, the number of elements in the sequence.
- The second line contains $n$ space-separated integers $p[i]$ where $1 \le i \le n$.

### Constraints
- $1 \le n \le 50$
- $1 \le p[i] \le 50$, where $1 \le i \le n$.
- Each element in the sequence is distinct.

---

### Sample Test Cases

#### Sample Input 0
```text
3
2 3 1
```

#### Sample Output 0
```text
2
3
1
```

#### Sample Input 1
```text
5
4 3 5 1 2
```

#### Sample Output 1
```text
1
3
5
4
2
```

---

### Python 3 Solution

> **Ý tưởng:**
> Ta cần tìm $y$ thỏa mãn $p(p(y)) = x$:
> 1. Lưu lại vị trí (1-based index) của từng giá trị trong mảng $p$ vào bảng tra cứu `pos`, nghĩa là `pos[val]` là vị trí mà tại đó $p[\text{pos}[val]] = val$.
> 2. Đặt $k = \text{pos}[x]$ (tức là $p[k] = x$).
> 3. Ta cần tìm $y$ sao cho $p[y] = k$, do đó $y = \text{pos}[k] = \text{pos}[\text{pos}[x]]$.
> 4. Duyệt $x$ từ $1$ đến $n$ và lưu lại các giá trị $y$.

```python
import os
import sys

def permutationEquation(p):
    # pos[val] lưu chỉ số 1-based index của val trong mảng p
    # Ví dụ p = [2, 3, 1], pos = {2: 1, 3: 2, 1: 3}
    pos = {val: idx + 1 for idx, val in enumerate(p)}
    
    result = []
    n = len(p)
    
    # Duyệt x từ 1 đến n
    for x in range(1, n + 1):
        # p(k) = x  => k = pos[x]
        # p(y) = k  => y = pos[k] = pos[pos[x]]
        y = pos[pos[x]]
        result.append(y)
        
    return result

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    n = int(input().strip())

    p = list(map(int, input().rstrip().split()))

    result = permutationEquation(p)

    fptr.write('\n'.join(map(str, result)))
    fptr.write('\n')

    fptr.close()
```
