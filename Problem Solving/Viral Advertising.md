# Viral Advertising

HackerLand Enterprise is adopting a new viral advertising strategy. When they launch a new product, they advertise it to exactly $5$ people on social media.

On the first day, half of those $5$ people (i.e., $\lfloor 5 / 2 \rfloor = 2$) like the advertisement and each shares it with $3$ of their friends. At the beginning of the second day, $2 \times 3 = 6$ people receive the advertisement.

Each day, $\lfloor \text{recipients} / 2 \rfloor$ of the recipients like the advertisement and will share it with $3$ friends on the following day. Assuming nobody receives the advertisement twice, determine how many people have liked the ad by the end of a given day, beginning with launch day as day $1$.

---

### Example
For $n = 5$:

| Day | Shared | Liked | Cumulative |
| :---: | :---: | :---: | :---: |
| 1 | 5 | 2 | 2 |
| 2 | 6 | 3 | 5 |
| 3 | 9 | 4 | 9 |
| 4 | 12 | 6 | 15 |
| 5 | 18 | 9 | 24 |

The cumulative number of likes on the $5^{\text{th}}$ day is `24`.

---

### Function Description
Complete the `viralAdvertising` function below.

`viralAdvertising` has the following parameter(s):
- `int n`: the day number to report

**Returns:**
- `int`: the cumulative likes up to that day

---

### Input Format
A single integer, $n$, the day number.

### Constraints
- $1 \le n \le 50$

---

### Sample Test Cases

#### Sample Input
```text
3
```

#### Sample Output
```text
9
```

**Explanation:**
- **Day 1:** $5$ people receive it, $\lfloor 5 / 2 \rfloor = 2$ like it. Cumulative = $2$. Next day shares = $2 \times 3 = 6$.
- **Day 2:** $6$ people receive it, $\lfloor 6 / 2 \rfloor = 3$ like it. Cumulative = $2 + 3 = 5$. Next day shares = $3 \times 3 = 9$.
- **Day 3:** $9$ people receive it, $\lfloor 9 / 2 \rfloor = 4$ like it. Cumulative = $5 + 4 = 9$.

---

### Python 3 Solution

> **Ý tưởng:** 
> - Khởi tạo ngày đầu tiên: `shared = 5`, `cumulative_likes = 0`.
> - Lặp qua từng ngày từ $1$ đến $n$:
>   - Số người like trong ngày: `liked = shared // 2`.
>   - Cộng dồn số like: `cumulative_likes += liked`.
>   - Số người nhận được quảng cáo ngày tiếp theo: `shared = liked * 3`.

```python
import os
import sys

def viralAdvertising(n):
    shared = 5
    cumulative_likes = 0
    
    for _ in range(n):
        liked = shared // 2
        cumulative_likes += liked
        shared = liked * 3
        
    return cumulative_likes

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    n = int(input().strip())

    result = viralAdvertising(n)

    fptr.write(str(result) + '\n')
    fptr.close()
```
