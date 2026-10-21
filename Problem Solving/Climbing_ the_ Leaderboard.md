# Climbing the Leaderboard

An arcade game player wants to climb to the top of the leaderboard and track their ranking. The game uses **Dense Ranking**, so its leaderboard works like this:
- The player with the highest score is ranked number $1$ on the leaderboard.
- Players who have equal scores receive the same ranking number, and the next player(s) receive the immediately following ranking number.

---

### Example
- $ranked = [100, 90, 90, 80]$
- $player = [70, 80, 105]$

The ranked players have ranks $1, 2, 2,$ and $3$ respectively.
- For score $70$: ranking is $4$ (below $80$).
- For score $80$: ranking is $3$ (tied with $80$).
- For score $105$: ranking is $1$ (above $100$).

Return $[4, 3, 1]$.

---

### Function Description
Complete the `climbingLeaderboard` function below.

`climbingLeaderboard` has the following parameter(s):
- `int ranked[n]`: the leaderboard scores in descending order
- `int player[m]`: the player's scores in ascending order

**Returns:**
- `int[m]`: the player's rank after each new score.

---

### Constraints
- $1 \le n \le 2 \times 10^5$
- $1 \le m \le 2 \times 10^5$
- $0 \le ranked[i] \le 10^9$ for $0 \le i < n$
- $0 \le player[j] \le 10^9$ for $0 \le j < m$
- Existing leaderboard `ranked` is sorted in descending order.
- Player's scores `player` are sorted in ascending order.

---

### Sample Test Cases

#### Sample Input 1
```text
7
100 100 50 40 40 20 10
4
5 25 50 120
```

#### Sample Output 1
```text
6
4
2
1
```

#### Sample Input 2
```text
6
100 90 90 80 75 60
5
50 65 77 90 102
```

#### Sample Output 2
```text
6
5
4
2
1
```

---

### Python 3 Solution

> **Ý tưởng:** 
> 1. Vì hệ thống xếp hạng theo **Dense Ranking**, các điểm trùng nhau có chung thứ hạng. Ta loại bỏ các điểm trùng lặp trong `ranked` bằng `sorted(list(set(ranked)))` (sắp xếp tăng dần). Lúc này, độ dài mảng chính là thứ hạng tối đa.
> 2. Vì mảng `player` đã được sắp xếp **tăng dần**, ta dùng một con trỏ đi từ trái sang phải trên mảng điểm độc nhất (hoặc sử dụng tìm kiếm nhị phân `bisect`). Cách dùng con trỏ hai chiều (Two Pointers) cho độ phức tạp tuyến tính $O(n + m)$, tối ưu tuyệt đối thời gian chạy.

```python
import os
import sys

def climbingLeaderboard(ranked, player):
    # Lấy các điểm số duy nhất và sắp xếp tăng dần
    unique_ranked = sorted(list(set(ranked)))
    n = len(unique_ranked)
    
    result = []
    i = 0  # Con trỏ duyệt từ điểm thấp nhất lên cao nhất
    
    for score in player:
        # Tăng con trỏ nếu điểm của player lớn hơn hoặc bằng điểm trên leaderboard
        while i < n and score >= unique_ranked[i]:
            i += 1
        
        # Thứ hạng: nếu i = n (vượt qua tất cả) -> rank 1
        # Ngược lại, rank = (n - i) + 1
        result.append(n - i + 1)
        
    return result

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    ranked_count = int(input().strip())
    ranked = list(map(int, input().rstrip().split()))

    player_count = int(input().strip())
    player = list(map(int, input().rstrip().split()))

    result = climbingLeaderboard(ranked, player)

    fptr.write('\n'.join(map(str, result)))
    fptr.write('\n')

    fptr.close()
```
