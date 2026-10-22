# Utopian Tree

The Utopian Tree goes through $2$ cycles of growth every year:
- Each **spring**, it doubles in height.
- Each **summer**, its height increases by $1$ meter.

A Utopian Tree sapling with a height of $1$ meter is planted at the onset of spring. How tall will the tree be after $n$ growth cycles?

---

### Example
If the number of growth cycles is $n = 5$:

| Period / Cycle ($i$) | Season | Action | Height |
| :---: | :---: | :---: | :---: |
| $0$ | — | Initial | $1$ |
| $1$ | Spring | Double ($\times 2$) | $2$ |
| $2$ | Summer | Increase ($+ 1$) | $3$ |
| $3$ | Spring | Double ($\times 2$) | $6$ |
| $4$ | Summer | Increase ($+ 1$) | $7$ |
| $5$ | Spring | Double ($\times 2$) | $14$ |

---

### Function Description
Complete the `utopianTree` function below.

`utopianTree` has the following parameter(s):
- `int n`: the number of growth cycles to simulate

**Returns:**
- `int`: the height of the tree after the given number of cycles.

---

### Input Format
- The first line contains an integer $t$, the number of test cases.
- $t$ subsequent lines each contain an integer $n$, the number of cycles for that testcase.

### Constraints
- $1 \le t \le 10$
- $0 \le n \le 60$

---

### Sample Test Cases

#### Sample Input
```text
3
0
1
4
```

#### Sample Output
```text
1
2
7
```

**Explanation:**
- Case 1 ($n = 0$): Chiều cao ban đầu không đổi $\rightarrow 1$.
- Case 2 ($n = 1$): Chu kỳ 1 (mùa xuân) nhân đôi $\rightarrow 1 \times 2 = 2$.
- Case 3 ($n = 4$): 
  - $i = 1$ (xuân): $1 \times 2 = 2$
  - $i = 2$ (hè): $2 + 1 = 3$
  - $i = 3$ (xuân): $3 \times 2 = 6$
  - $i = 4$ (hè): $6 + 1 = 7$  
  $\rightarrow 7$.

---

### C++11 Solution

> **Ý tưởng:** 
> - Khởi tạo chiều cao ban đầu `height = 1`.
> - Duyệt chu kỳ $i$ từ $1$ đến $n$:
>   - Nếu $i$ là số lẻ (mùa xuân): `height *= 2`.
>   - Nếu $i$ là số chẵn (mùa hè): `height += 1`.
> - Với $n \le 60$, mô phỏng tuyến tính $O(n)$ chạy tức thì ($< 1$ ms).

```cpp
#include <iostream>
#include <vector>

using namespace std;

int utopianTree(int n) {
    int height = 1;
    for (int i = 1; i <= n; ++i) {
        if (i % 2 != 0) {
            // Chu kỳ lẻ: Mùa xuân (nhân đôi)
            height *= 2;
        } else {
            // Chu kỳ chẵn: Mùa hè (tăng 1m)
            height += 1;
        }
    }
    return height;
}

int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);

    int t;
    if (cin >> t) {
        while (t--) {
            int n;
            cin >> n;
            cout << utopianTree(n) << "\n";
        }
    }

    return 0;
}
```
