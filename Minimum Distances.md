# Minimum Distances

The distance between two array values is the number of indices between them. Given $a$, find the minimum distance between any pair of equal elements in the array. If no such value exists, return `-1`.

---

### Example
- $a = [3, 2, 1, 2, 3]$

There are two matching pairs of values: $3$ and $2$.
- The indices of the $3$'s are $0$ and $4$, so their distance is $\vert{}4 - 0\vert{} = 4$.
- The indices of the $2$'s are $1$ and $3$, so their distance is $\vert{}3 - 1\vert{} = 2$.

The minimum distance is `2`.

---

### Function Description
Complete the `minimumDistances` function below.

`minimumDistances` has the following parameter(s):
- `int a[n]`: an array of integers

**Returns:**
- `int`: the minimum distance found or `-1` if there are no matching elements.

---

### Input Format
- The first line contains an integer $n$, the size of array $a$.
- The second line contains $n$ space-separated integers $a[i]$.

### Constraints
- $1 \le n \le 10^3$
- $1 \le a[i] \le 10^5$

---

### Sample Test Cases

#### Sample Input
```text
6
7 1 3 4 1 7
```

#### Sample Output
```text
3
```

**Explanation:**
There are two pairs to consider:
- $a[1]$ and $a[4]$ are both $1$, so $d_{1, 4} = \vert{}1 - 4\vert{} = 3$.
- $a[0]$ and $a[5]$ are both $7$, so $d_{0, 5} = \vert{}0 - 5\vert{} = 5$.

The minimum distance is `3`.

---

### Python 3 Solution

> **Ý tưởng tối ưu $O(n)$:**
> - Khoảng cách nhỏ nhất giữa hai phần tử bằng nhau luôn đạt được bởi **hai lần xuất hiện liền kề nhau** của giá trị đó.
> - Sử dụng một từ điển `last_seen` để lưu chỉ số xuất hiện gần nhất của mỗi giá trị khi duyệt mảng từ trái sang phải.
> - Nếu giá trị `val` đã từng xuất hiện trước đó tại chỉ số `last_seen[val]`, tính khoảng cách `i - last_seen[val]` và cập nhật `min_dist`.
> - Cập nhật lại `last_seen[val] = i`. Nếu không tìm thấy cặp nào bằng nhau, trả về `-1`.

```python
import os
import sys

def minimumDistances(a):
    last_seen = {}
    min_dist = float('inf')
    
    for i, val in enumerate(a):
        if val in last_seen:
            min_dist = min(min_dist, i - last_seen[val])
        last_seen[val] = i
        
    return min_dist if min_dist != float('inf') else -1

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    n = int(input().strip())

    a = list(map(int, input().rstrip().split()))

    result = minimumDistances(a)

    fptr.write(str(result) + '\n')
    fptr.close()
```
