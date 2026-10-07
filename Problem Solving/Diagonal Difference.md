# Diagonal Difference

Given a square matrix, calculate the absolute difference between the sums of its diagonals.

---

### Description & Sample

- **Matrix:**
  $$\begin{bmatrix} 11 & 2 & 4 \\ 4 & 5 & 6 \\ 10 & 8 & -12 \end{bmatrix}$$
- **Primary Diagonal:** $11 + 5 + (-12) = 4$
- **Secondary Diagonal:** $4 + 5 + 10 = 19$
- **Result:** $\vert{}4 - 19\vert{} = 15$

| Input | Output | Return Type |
| :--- | :--- | :--- |
| `3`<br>`11 2 4`<br>`4 5 6`<br>`10 8 -12` | `15` | `int`: $\vert{} \sum \text{diag}_1 - \sum \text{diag}_2 \vert{}$ |

---

### Solution (C++)

```cpp
#include <iostream>
#include <vector>
#include <cmath>

using namespace std;

int diagonalDifference(const vector<vector<int>>& arr) {
    int n = arr.size();
    int primary_sum = 0, secondary_sum = 0;
    
    for (int i = 0; i < n; i++) {
        primary_sum += arr[i][i];
        secondary_sum += arr[i][n - 1 - i];
    }
    
    return abs(primary_sum - secondary_sum);
}

int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);

    int n;
    if (!(cin >> n)) return 0;
    
    vector<vector<int>> arr(n, vector<int>(n));
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) cin >> arr[i][j];
    }
    
    cout << diagonalDifference(arr) << "\n";
    return 0;
}
