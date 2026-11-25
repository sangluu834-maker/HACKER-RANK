# Beautiful Triplets

Given a sequence of integers $a$, a triplet $(a[i], a[j], a[k])$ is beautiful if:
- $i < j < k$
- $a[j] - a[i] = a[k] - a[j] = d$

Given an increasing sequence of integers and the value of $d$, count the number of beautiful triplets in the sequence.

---

### Example
- $\text{arr} = [2, 2, 3, 4, 5]$
- $d = 1$

There are three beautiful triplets, by index: $[i, j, k] = [0, 2, 3], [1, 2, 3], [2, 3, 4]$.
To test the first triplet: $\text{arr}[2] - \text{arr}[0] = 3 - 2 = 1$ and $\text{arr}[3] - \text{arr}[2] = 4 - 3 = 1$.

---

### Function Description
Complete the `beautifulTriplets` function below.

`beautifulTriplets` has the following parameters:
- `int d`: the value to match
- `int arr[n]`: the sequence, sorted ascending

**Returns:**
- `int`: the number of beautiful triplets.

---

### Input Format
- The first line contains $2$ space-separated integers, $n$ and $d$, the length of the sequence and the beautiful difference.
- The second line contains $n$ space-separated integers $\text{arr}[i]$.

### Constraints
- $1 \le n \le 10^4$
- $1 \le d \le 20$
- $0 \le \text{arr}[i] \le 2 \times 10^4$
- $\text{arr}[i] > \text{arr}[i - 1]$ (or sorted ascending)

---

### Sample Test Cases

#### Sample Input
```text
7 3
1 2 4 5 7 8 10
```

#### Sample Output
```text
3
```

**Explanation:**
The beautiful triplets by value are $(1, 4, 7)$, $(4, 7, 10)$, and $(2, 5, 8)$:
- $4 - 1 = 3$ and $7 - 4 = 3$
- $7 - 4 = 3$ and $10 - 7 = 3$
- $5 - 2 = 3$ and $8 - 5 = 3$

Total count = `3`.

---

### Python 3 Solution

> **Ý tưởng tối ưu $O(n)$:**
> - Với mỗi phần tử $x$ trong mảng tăng dần, một bộ ba đẹp bắt đầu bằng $x$ sẽ có dạng $(x, x + d, x + 2d)$.
> - Ta dùng `collections.Counter` (hoặc `set` nếu các phần tử đảm bảo phân biệt hoàn toàn) để đếm số lần xuất hiện của từng giá trị trong mảng.
> - Duyệt qua từng phần tử $x$ trong mảng: nếu cả $x + d$ và $x + 2d$ đều tồn tại, số bộ ba đẹp tạo thành từ $x$ là $\text{counts}[x + d] \times \text{counts}[x + 2d]$ (với mảng tăng ngặt thì tích này bằng $1$).
> - Độ phức tạp thời gian: $O(n)$, không gian: $O(n)$.

```python
from collections import Counter
import os
import sys

def beautifulTriplets(d, arr):
    # Đếm tần suất xuất hiện của từng số (xử lý được cả trường hợp có số trùng lặp)
    counts = Counter(arr)
    triplets = 0
    
    for x in arr:
        if (x + d) in counts and (x + 2 * d) in counts:
            triplets += counts[x + d] * counts[x + 2 * d]
            
    return triplets

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    first_multiple_input = input().rstrip().split()

    n = int(first_multiple_input[0])
    d = int(first_multiple_input[1])

    arr = list(map(int, input().rstrip().split()))

    result = beautifulTriplets(d, arr)

    fptr.write(str(result) + '\n')
    fptr.close()
```
