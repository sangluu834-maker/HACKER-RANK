# Picking Numbers

Given an array of integers, find the longest subarray (or subset) where the absolute difference between any two elements is less than or equal to $1$.

---

### Example
$$a = [1, 1, 2, 2, 4, 4, 5, 5, 5]$$

There are two valid subsets meeting the criterion:
- $[1, 1, 2, 2]$ (difference between any pair $\le 1$, length = $4$)
- $[4, 4, 5, 5, 5]$ (difference between any pair $\le 1$, length = $5$)

The maximum length subarray has $5$ elements. Return `5`.

---

### Function Description
Complete the `pickingNumbers` function below.

`pickingNumbers` has the following parameter(s):
- `int a[n]`: an array of integers

**Returns:**
- `int`: the length of the longest subarray that meets the criterion.

---

### Input Format
- The first line contains a single integer $n$, the size of the array $a$.
- The second line contains $n$ space-separated integers, each an $a[i]$.

### Constraints
- $2 \le n \le 100$
- $0 < a[i] < 100$
- The answer will be $\ge 2$.

---

### Sample Test Cases

#### Sample Input 0
```text
6
4 6 5 3 3 1
```

#### Sample Output 0
```text
3
```
*Explanation:* We can choose $[4, 3, 3]$ (pair differences $\le 1$). The maximum length is $3$.

#### Sample Input 1
```text
6
1 2 2 3 1 2
```

#### Sample Output 1
```text
5
```
*Explanation:* We can choose $[1, 2, 2, 1, 2]$ (pair differences $\le 1$). The maximum length is $5$.

---

### Python 3 Solution

> **Ý tưởng:** Đếm tần suất xuất hiện của từng số trong mảng bằng `Counter`. Với mỗi số $x$, một tập hợp hợp lệ chỉ có thể chứa hai giá trị liên tiếp là $x$ và $x + 1$ (sao cho hiệu giữa hai phần tử bất kỳ $\le 1$). Kết quả là giá trị lớn nhất của `count[x] + count[x + 1]`.

```python
import os
import sys
from collections import Counter

def pickingNumbers(a):
    counts = Counter(a)
    max_length = 0
    
    # Duyệt qua các số xuất hiện trong mảng
    for num in counts:
        # Số lượng phần tử gồm các giá trị num và num + 1
        current_length = counts[num] + counts.get(num + 1, 0)
        if current_length > max_length:
            max_length = current_length
            
    return max_length

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    n = int(input().strip())
    a = list(map(int, input().rstrip().split()))

    result = pickingNumbers(a)
    fptr.write(str(result) + '\n')

    fptr.close()
```
