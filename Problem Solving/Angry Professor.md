# Angry Professor

A Discrete Mathematics professor has a class of students. Frustrated with their lack of discipline, the professor decides to cancel class if fewer than some number of students are present when class starts. Arrival times go from on time ($a[i] \le 0$) to arrived late ($a[i] > 0$).

Given the arrival time of each student and a threshold number of attendees $k$, determine if the class is cancelled.

**Note:**
- Non-positive arrival times ($a[i] \le 0$) indicate the student arrived early or on time.
- Positive arrival times ($a[i] > 0$) indicate the student arrived $a[i]$ minutes late.

---

### Example
- $k = 3$
- $a = [-2, -1, 0, 1, 2]$

The first $3$ students arrived on time or early (times $\le 0$). The last $2$ were late. The threshold is $k = 3$ students, so the class will go on. Return `NO`.

---

### Function Description
Complete the `angryProfessor` function below.

`angryProfessor` has the following parameter(s):
- `int k`: the threshold number of students
- `vector<int> a`: the arrival times of the $n$ students

**Returns:**
- `string`: either `'YES'` (if the class is cancelled) or `'NO'` (if the class is not cancelled).

---

### Input Format
- The first line contains an integer $t$, the number of test cases.
- Each test case consists of two lines:
  - The first line has two space-separated integers, $n$ and $k$, the number of students and the cancellation threshold.
  - The second line contains $n$ space-separated integers ($a[0], a[1], \dots, a[n-1]$) describing the arrival times for each student.

### Constraints
- $1 \le t \le 10$
- $1 \le n \le 1000$
- $1 \le k \le n$
- $-100 \le a[i] \le 100$, where $i \in [0, n-1]$

---

### Sample Test Cases

#### Sample Input
```text
2
4 3
-1 -3 4 2
4 2
0 -1 2 1
```

#### Sample Output
```text
YES
NO
```

**Explanation:**
- **Test case 1:** $k = 3$. Only $2$ students arrived on time ($-1$ and $-3$). Since $2 < 3$, the class is cancelled $\rightarrow$ `YES`.
- **Test case 2:** $k = 2$. There are $2$ students on time ($0$ and $-1$). Since $2 \ge 2$, the class goes on $\rightarrow$ `NO`.

---

### C++11 Solution

> **Ý tưởng:** 
> Đếm số lượng học sinh đến đúng giờ hoặc sớm (tức là $a[i] \le 0$).
> - Nếu số học sinh đến đúng giờ $< k$, lớp học bị hủy $\rightarrow$ trả về `"YES"`.
> - Ngược lại, lớp học vẫn diễn ra $\rightarrow$ trả về `"NO"`.

```cpp
#include <iostream>
#include <vector>
#include <string>

using namespace std;

string angryProfessor(int k, const vector<int>& a) {
    int on_time_count = 0;
    
    for (int time : a) {
        if (time <= 0) {
            on_time_count++;
        }
    }
    
    // Nếu số học sinh đến đúng giờ ít hơn ngưỡng k thì hủy lớp
    if (on_time_count < k) {
        return "YES";
    } else {
        return "NO";
    }
}

int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);

    int t;
    if (cin >> t) {
        while (t--) {
            int n, k;
            cin >> n >> k;
            
            vector<int> a(n);
            for (int i = 0; i < n; ++i) {
                cin >> a[i];
            }
            
            cout << angryProfessor(k, a) << "\n";
        }
    }

    return 0;
}
```
