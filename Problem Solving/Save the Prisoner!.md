# Save the Prisoner!

A jail has a number of prisoners and a number of treats to pass out to them. Their jailer decides the fairest way to divide the treats is to seat the prisoners around a circular table in sequentially numbered chairs. A chair number will be drawn from a hat. Beginning with the prisoner in that chair, one candy will be handed to each prisoner sequentially around the table until all have been distributed.

The jailer is playing a little joke, though. The last piece of candy looks like all the others, but it tastes awful. Determine the chair number occupied by the prisoner who will receive that candy.

---

### Example
- $n = 4$ (prisoners)
- $m = 6$ (pieces of candy)
- $s = 2$ (starting chair)

Prisoners receive candies in this order: $2, 3, 4, 1, 2, 3$.  
The $6^{\text{th}}$ and final candy goes to chair $3$. Return `3`.

---

### Function Description
Complete the `saveThePrisoner` function below.

`saveThePrisoner` has the following parameter(s):
- `int n`: the number of prisoners
- `int m`: the number of sweets
- `int s`: the chair number to begin passing out sweets from

**Returns:**
- `int`: the chair number of the prisoner who receives the awful candy.

---

### Input Format
- The first line contains an integer $t$, the number of test cases.
- The next $t$ lines each contain three space-separated integers: $n$, $m$, and $s$.

### Constraints
- $1 \le t \le 100$
- $1 \le n \le 10^9$
- $1 \le m \le 10^9$
- $1 \le s \le n$

---

### Sample Test Cases

#### Sample Input 0
```text
2
5 2 1
5 2 2
```

#### Sample Output 0
```text
2
3
```

#### Sample Input 1
```text
2
7 19 2
3 7 3
```

#### Sample Output 1
```text
6
3
```

---

### Python 3 Solution

> **Ý tưởng:** 
> - Vì mảng ghế đánh số từ $1$ đến $n$ và xếp vòng tròn:
>   - Ta chuyển về hệ cơ số 0 bằng cách trừ $1$: ghế bắt đầu là $s - 1$.
>   - Sau khi phát $m$ viên kẹo, vị trí rơi vào: $(s - 1 + m - 1) \pmod n$.
>   - Đổi lại về hệ cơ số 1 bằng cách cộng $1$: `((s - 1 + m - 1) % n) + 1`.
> - Độ phức tạp thời gian: $O(1)$ cho mỗi truy vấn, tối ưu tuyệt đối và không bị quá thời gian chạy với $n, m \le 10^9$.

```python
import os
import sys

def saveThePrisoner(n, m, s):
    # Công thức toán học O(1)
    return ((s - 1 + m - 1) % n) + 1

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    t = int(input().strip())

    for t_itr in range(t):
        first_multiple_input = input().rstrip().split()

        n = int(first_multiple_input[0])
        m = int(first_multiple_input[1])
        s = int(first_multiple_input[2])

        result = saveThePrisoner(n, m, s)
        fptr.write(str(result) + '\n')

    fptr.close()
```
