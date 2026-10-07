# Mini-Max Sum

Given five positive integers, find the minimum and maximum values that can be calculated by summing exactly four of the five integers. Print the respective minimum and maximum values as a single line of two space-separated long integers.

---

### Function Description

Complete the `miniMaxSum` function in the editor below.

`miniMaxSum` has the following parameter(s):
- `arr`: an array of 5 integers

**Print:**
- Print two space-separated integers on one line: the minimum sum and the maximum sum of 4 of 5 elements. No value should be returned.

---

### Input & Output Format

- **Input:**
  - A single line of five space-separated integers.
- **Output:**
  - Print two space-separated integers denoting the minimum and maximum values.

---

### Sample Test

| Input | Output | Explanation |
| :--- | :--- | :--- |
| `1 2 3 4 5` | `10 14` | Sum everything except 5: $1+2+3+4 = 10$ (Min)<br>Sum everything except 1: $2+3+4+5 = 14$ (Max) |

---

### Solution (Python 3)

```python
import sys

def miniMaxSum(arr):    
    tong_tat_ca = sum(arr)    
    so_be_nhat = min(arr)
    so_lon_nhat = max(arr)    
    
    tong_nho_nhat = tong_tat_ca - so_lon_nhat
    tong_lon_nhat = tong_tat_ca - so_be_nhat
        
    print(f"{tong_nho_nhat} {tong_lon_nhat}")

if __name__ == '__main__':
    arr = list(map(int, input().rstrip().split()))
    miniMaxSum(arr)
