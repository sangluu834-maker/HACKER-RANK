# Compare the Triplets

Alice and Bob each created one problem for HackerRank. A reviewer rates the two challenges, awarding points on a scale from 1 to 100 for three categories: problem clarity, originality, and difficulty.

The rating for Alice's challenge is the triplet $a = [a[0], a[1], a[2]]$, and the rating for Bob's challenge is the triplet $b = [b[0], b[1], b[2]]$.

The task is to find their comparison points by comparing each category:
- If $a[i] > b[i]$, Alice receives 1 point.
- If $a[i] < b[i]$, Bob receives 1 point.
- If $a[i] = b[i]$, neither person receives a point.

---

### Function Description

Complete the `compareTriplets` function in the editor below.

`compareTriplets` has the following parameter(s):
- `a`: an array of 3 integers representing Alice's score
- `b`: an array of 3 integers representing Bob's score

**Returns:**
- `int[2]`: An array of two integers where the first value is Alice's score and the second is Bob's score.

---

### Input & Output Format

- **Input:**
  - The first line contains 3 space-separated integers representing triplet $a$.
  - The second line contains 3 space-separated integers representing triplet $b$.
- **Constraints:**
  - $1 \le a[i] \le 100$
  - $1 \le b[i] \le 100$
- **Output:**
  - Print two space-separated integers denoting the respective comparison points earned by Alice and Bob.

---

### Sample Tests

| Input | Output | Explanation |
| :--- | :--- | :--- |
| `5 6 7`<br>`3 6 10` | `1 1` | $a[0] > b[0]$ (Alice +1), $a[1] = b[1]$ (No point), $a[2] < b[2]$ (Bob +1). |
| `17 28 30`<br>`99 16 8` | `2 1` | $a[0] < b[0]$ (Bob +1), $a[1] > b[1]$ (Alice +1), $a[2] > b[2]$ (Alice +1). |

---

### Solution (C++)

```cpp
#include <iostream>
#include <vector>

using namespace std;

vector<int> compareTriplets(const vector<int>& a, const vector<int>& b) {
    int alice = 0, bob = 0;
    for (int i = 0; i < 3; i++) {
        if (a[i] > b[i]) {
            alice++;
        } else if (a[i] < b[i]) {
            bob++;
        }
    }
    return {alice, bob};
}

int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);

    vector<int> a(3), b(3);
    for (int i = 0; i < 3; i++) cin >> a[i];
    for (int i = 0; i < 3; i++) cin >> b[i];
    
    vector<int> res = compareTriplets(a, b);
    cout << res[0] << " " << res[1] << "\n";

    return 0;
}
