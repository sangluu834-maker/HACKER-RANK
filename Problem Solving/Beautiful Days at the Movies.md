# Beautiful Days at the Movies

Lily likes to play games with integers. She has created a new game where she determines the difference between a number and its reverse. For instance, given the number $12$, its reverse is $21$, and their difference is $\vert{}12 - 21\vert{} = 9$. The number $120$ reversed is $21$, and their difference is $\vert{}120 - 21\vert{} = 99$.

She decides to apply her game to decision making. She will look at a numbered range of days and will only go to a movie on a beautiful day.

Given a range of numbered days $[i, j]$ and a number $k$, determine the number of days in the range that are beautiful. Beautiful numbers are defined as numbers where $\vert{}x - \text{reverse}(x)\vert{}$ is evenly divisible by $k$ (i.e., $\vert{}x - \text{reverse}(x)\vert{} \pmod k == 0$).

---

### Function Description
Complete the `beautifulDays` function below.

`beautifulDays` has the following parameter(s):
- `int i`: the starting day number
- `int j`: the ending day number
- `int k`: the divisor

**Returns:**
- `int`: the number of beautiful days in the range $[i, j]$

---

### Input Format
A single line of three space-separated integers describing the respective values of $i$, $j$, and $k$.

### Constraints
- $1 \le i \le j \le 2 \times 10^6$
- $1 \le k \le 2 \times 10^9$

---

### Sample Test Cases

#### Sample Input
```text
20 23 6
```

#### Sample Output
```text
2
```

**Explanation:**
Lily tests each day from $20$ to $23$:
- Day $20$: $|20 - 02| = 18 \rightarrow 18 / 6 = 3$ (whole number $\rightarrow$ Beautiful)
- Day $21$: $|21 - 12| = 9 \rightarrow 9 / 6 = 1.5$ (not a whole number)
- Day $22$: $|22 - 22| = 0 \rightarrow 0 / 6 = 0$ (whole number $\rightarrow$ Beautiful)
- Day $23$: $|23 - 32| = 9 \rightarrow 9 / 6 = 1.5$ (not a whole number)

There are $2$ beautiful days ($20$ and $22$).

---

### C++11 Solution

> **Ý tưởng:**
> - Viết một hàm phụ trợ đảo ngược số nguyên bằng cách lấy từng chữ số dư khi chia cho $10$.
> - Duyệt biến $day$ chạy từ $i$ đến $j$.
> - Kiểm tra xem `abs(day - reverse(day)) % k == 0` hay không; nếu có thì tăng biến đếm.

```cpp
#include <iostream>
#include <cmath>

using namespace std;

// Hàm đảo ngược các chữ số của một số nguyên
long long reverseNumber(long long n) {
    long long rev = 0;
    while (n > 0) {
        rev = rev * 10 + (n % 10);
        n /= 10;
    }
    return rev;
}

int beautifulDays(int i, int j, int k) {
    int beautiful_count = 0;
    
    for (int day = i; day <= j; ++day) {
        long long rev = reverseNumber(day);
        if (abs(day - rev) % k == 0) {
            beautiful_count++;
        }
    }
    
    return beautiful_count;
}

int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);

    int i, j, k;
    if (cin >> i >> j >> k) {
        cout << beautifulDays(i, j, k) << "\n";
    }

    return 0;
}
```
