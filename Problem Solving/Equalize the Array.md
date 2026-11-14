# Equalize the Array

Given an array of integers, determine the minimum number of elements to delete to leave only elements of equal value.

---

### Example
- $\text{arr} = [1, 2, 2, 3]$

Delete the $2$ elements $1$ and $3$ leaving $[2, 2]$. If both twos plus either the $1$ or the $3$ are deleted, it takes $3$ deletions to leave either $[3]$ or $[1]$. The minimum number of deletions is `2`.

---

### Function Description
Complete the `equalizeArray` function below.

`equalizeArray` has the following parameter(s):
- `int arr[n]`: an array of integers

**Returns:**
- `int`: the minimum number of deletions required.

---

### Input Format
- The first line contains an integer $n$, the number of elements in $\text{arr}$.
- The next line contains $n$ space-separated integers $\text{arr}[i]$.

### Constraints
- $1 \le n \le 100$
- $1 \le \text{arr}[i] \le 100$

---

### Sample Test Cases

#### Sample Input
```text
5
3 3 2 1 3
```

#### Sample Output
```text
2
```

**Explanation:**
Delete $2$ and $1$ to leave $[3, 3, 3]$. This is minimal ($2$ deletions). The only other options are to delete $4$ elements to get an array of either $[1]$ or $[2]$.

---

### Python 3 Solution

> **Ý tưởng:**
> - Để số phần tử cần xóa là ít nhất, ta cần giữ lại phần tử xuất hiện nhiều lần nhất trong mảng.
> - Dùng `collections.Counter` để đếm tần suất xuất hiện của từng giá trị trong `arr`.
> - Tìm tần suất lớn nhất `max_freq`.
> - Số phần tử tối thiểu cần xóa chính là:
>   $$\text{min\_deletions} = n - \text{max\_freq}$$
> - Độ phức tạp thời gian: $O(n)$, không gian: $O(n)$.

```python
from collections import Counter
import os
import sys

def equalizeArray(arr):
    # Đếm tần suất xuất hiện của từng phần tử
    counts = Counter(arr)
    
    # Giữ lại nhóm phần tử xuất hiện nhiều nhất, xóa tất cả các phần tử còn lại
    max_freq = max(counts.values())
    
    return len(arr) - max_freq

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    n = int(input().strip())

    arr = list(map(int, input().rstrip().split()))

    result = equalizeArray(arr)

    fptr.write(str(result) + '\n')
    fptr.close()
```
