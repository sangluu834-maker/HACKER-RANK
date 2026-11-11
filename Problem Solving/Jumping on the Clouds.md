# Jumping on the Clouds

There is a new mobile game that starts with consecutively numbered clouds. Some of the clouds are thunderheads and others are cumulus. The player can jump on any cumulus cloud having a number that is equal to the number of the current cloud plus $1$ or $2$. The player must avoid the thunderheads. Determine the minimum number of jumps it will take to jump from the starting position to the last cloud. It is always possible to win the game.

For each game, you will get an array of clouds numbered $0$ if they are safe or $1$ if they must be avoided.

---

### Example
- $c = [0, 1, 0, 0, 0, 1, 0]$

Index the array from $0 \dots 6$. The player must avoid clouds at indices $1$ and $5$.
- Path 1: $0 \rightarrow 2 \rightarrow 3 \rightarrow 4 \rightarrow 6$ ($4$ jumps)
- Path 2: $0 \rightarrow 2 \rightarrow 4 \rightarrow 6$ ($3$ jumps)

The minimum number of jumps required is `3`.

---

### Function Description
Complete the `jumpingOnClouds` function below.

`jumpingOnClouds` has the following parameter(s):
- `int c[n]`: an array of binary integers

**Returns:**
- `int`: the minimum number of jumps required.

---

### Input Format
- The first line contains an integer $n$, the total number of clouds.
- The second line contains $n$ space-separated binary integers describing clouds $c[i]$ where $0 \le i < n$.

### Constraints
- $2 \le n \le 100$
- $c[i] \in \{0, 1\}$
- $c[0] = c[n - 1] = 0$

---

### Sample Test Cases

#### Sample Input 0
```text
7
0 0 1 0 0 1 0
```

#### Sample Output 0
```text
4
```

**Explanation 0:**
Path: $0 \rightarrow 1 \rightarrow 3 \rightarrow 4 \rightarrow 6$ ($4$ jumps).

#### Sample Input 1
```text
6
0 0 0 0 1 0
```

#### Sample Output 1
```text
3
```

**Explanation 1:**
Path: $0 \rightarrow 2 \rightarrow 3 \rightarrow 5$ ($3$ jumps).

---

### Python 3 Solution

> **Ý tưởng tham lam (Greedy approach):**
> - Để giảm thiểu tổng số bước nhảy, tại mỗi vị trí ta luôn ưu tiên nhảy xa nhất có thể ($2$ bước).
> - Nếu bước nhảy $2$ (`i + 2 < n` và `c[i + 2] == 0`) an toàn, ta nhảy thẳng đến `i + 2`.
> - Nếu không thể nhảy $2$ bước (vướng sấm sét hoặc vượt ngoài phạm vi mảng), ta bắt buộc phải nhảy $1$ bước đến `i + 1`.
> - Mỗi lần nhảy tăng biến đếm `jumps` lên $1$ cho đến khi đến vị trí cuối cùng `n - 1`.

```python
import os
import sys

def jumpingOnClouds(c):
    n = len(c)
    jumps = 0
    i = 0
    
    while i < n - 1:
        # Ưu tiên nhảy 2 bước nếu không vượt quá mảng và là đám mây an toàn
        if i + 2 < n and c[i + 2] == 0:
            i += 2
        else:
            i += 1
        jumps += 1
        
    return jumps

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    n = int(input().strip())

    c = list(map(int, input().rstrip().split()))

    result = jumpingOnClouds(c)

    fptr.write(str(result) + '\n')
    fptr.close()
```
