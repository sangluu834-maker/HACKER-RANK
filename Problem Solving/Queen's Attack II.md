# Queen's Attack II

You will be given a square chess board with one queen and a number of obstacles placed on it. Determine how many squares the queen can attack.

A queen is standing on an $n \times n$ chessboard. The chess board's rows are numbered from $1$ to $n$, going from bottom to top. Its columns are numbered from $1$ to $n$, going from left to right. Each square is referenced by a tuple, $(r, c)$, describing the row, $r$, and column, $c$, where the square is located.

The queen is standing at position $(r_q, c_q)$. In a single move, she can attack any square in any of the eight directions (left, right, up, down, and the four diagonals).

There are obstacles on the chessboard, each preventing the queen from attacking any square beyond it on that path. Given the queen's position and the locations of all the obstacles, find and print the number of squares the queen can attack from her position at $(r_q, c_q)$.

---

### Function Description
Complete the `queensAttack` function below.

`queensAttack` has the following parameters:
- `int n`: the number of rows and columns in the board
- `int k`: the number of obstacles on the board
- `int r_q`: the row number of the queen's position
- `int c_q`: the column number of the queen's position
- `int obstacles[k][2]`: each element is an array of $2$ integers, the row and column of an obstacle

**Returns:**
- `int`: the number of squares the queen can attack.

---

### Input Format
- The first line contains two space-separated integers $n$ and $k$, the length of the board's sides and the number of obstacles.
- The next line contains two space-separated integers $r_q$ and $c_q$, the queen's row and column position.
- Each of the next $k$ lines contains two space-separated integers $r[i]$ and $c[i]$, the row and column position of $\text{obstacles}[i]$.

### Constraints
- $0 < n \le 10^5$
- $0 \le k \le 10^5$
- A single cell may contain more than one obstacle.
- There will never be an obstacle at the position where the queen is located.

---

### Sample Test Cases

#### Sample Input 0
```text
4 0
4 4
```

#### Sample Output 0
```text
9
```

**Explanation 0:**
The queen is standing at position $(4, 4)$ on a $4 \times 4$ chessboard with no obstacles, so she can attack $9$ squares ($3$ down, $3$ left, $3$ down-left).

#### Sample Input 1
```text
5 3
4 3
5 5
4 2
2 3
```

#### Sample Output 1
```text
10
```

**Explanation 1:**
The queen is standing at position $(4, 3)$ on a $5 \times 5$ chessboard with $3$ obstacles at $(5, 5)$, $(4, 2)$, and $(2, 3)$. The total number of attackable squares is `10`.

#### Sample Input 2
```text
1 0
1 1
```

#### Sample Output 2
```text
0
```

**Explanation 2:**
Since there is only one square, and the queen is on it, she can move $0$ squares.

---

### Python 3 Solution

> **Ý tưởng tối ưu $O(k)$:**
> - Với $n \le 10^5$, việc tạo ma trận $n \times n$ sẽ gây tràn bộ nhớ (MLE) và chạy quá thời gian (TLE).
> - Thay vào đó, ta chỉ cần theo dõi **khoảng cách tối đa** quân Hậu có thể đi theo **8 hướng** độc lập:
>   1. **Lên (`up`):** $n - r_q$
>   2. **Xuống (`down`):** $r_q - 1$
>   3. **Trái (`left`):** $c_q - 1$
>   4. **Phải (`right`):** $n - c_q$
>   5. **Chéo lên-trái (`up_left`):** $\min(n - r_q, c_q - 1)$
>   6. **Chéo lên-phải (`up_right`):** $\min(n - r_q, n - c_q)$
>   7. **Chéo xuống-trái (`down_left`):** $\min(r_q - 1, c_q - 1)$
>   8. **Chéo xuống-phải (`down_right`):** $\min(r_q - 1, n - c_q)$
> - Duyệt qua từng chướng ngại vật $(r, c)$ trong `obstacles`: kiểm tra xem nó có nằm trên một trong 8 đường đi của quân Hậu hay không (cùng hàng, cùng cột, hoặc $\vert{}r - r_q\vert{} == \vert{}c - c_q\vert{}$). Nếu có, cập nhật lại giới hạn bước đi trên hướng tương ứng bằng `min(khoảng_cách_hiện_tại, số_ô_trống_tới_vật_cản)`.
> - Cộng tổng số ô đi được của cả 8 hướng là ra kết quả.

```python
import os
import sys

def queensAttack(n, k, r_q, c_q, obstacles):
    # Số ô tối đa có thể đi theo 8 hướng khi chưa có vật cản
    up = n - r_q
    down = r_q - 1
    left = c_q - 1
    right = n - c_q
    up_left = min(up, left)
    up_right = min(up, right)
    down_left = min(down, left)
    down_right = min(down, right)
    
    # Cập nhật giới hạn dựa trên từng chướng ngại vật
    for r, c in obstacles:
        # Cùng cột (đi lên hoặc đi xuống)
        if c == c_q:
            if r > r_q:
                up = min(up, r - r_q - 1)
            else:
                down = min(down, r_q - r - 1)
                
        # Cùng hàng (đi trái hoặc đi phải)
        elif r == r_q:
            if c < c_q:
                left = min(left, c_q - c - 1)
            else:
                right = min(right, c - c_q - 1)
                
        # Nằm trên đường chéo
        elif abs(r - r_q) == abs(c - c_q):
            dist = abs(r - r_q) - 1
            if r > r_q and c < c_q:
                up_left = min(up_left, dist)
            elif r > r_q and c > c_q:
                up_right = min(up_right, dist)
            elif r < r_q and c < c_q:
                down_left = min(down_left, dist)
            elif r < r_q and c > c_q:
                down_right = min(down_right, dist)
                
    return up + down + left + right + up_left + up_right + down_left + down_right

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    first_multiple_input = input().rstrip().split()

    n = int(first_multiple_input[0])
    k = int(first_multiple_input[1])

    second_multiple_input = input().rstrip().split()

    r_q = int(second_multiple_input[0])
    c_q = int(second_multiple_input[1])

    obstacles = []
    for _ in range(k):
        obstacles.append(list(map(int, input().rstrip().split())))

    result = queensAttack(n, k, r_q, c_q, obstacles)

    fptr.write(str(result) + '\n')
    fptr.close()
```
