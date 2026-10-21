# Electronics Shop

A person wants to determine the most expensive computer keyboard and USB drive that can be purchased with a given budget. Given price lists for keyboards and USB drives and a budget, find the cost to buy them. If it is not possible to buy both items, return -1.

---

### Example
- $b = 60$
- $keyboards = [40, 50, 60]$
- $drives = [5, 8, 12]$

The person can buy a $40\text{ keyboard} + 12\text{ USB drive} = 52$, or a $50\text{ keyboard} + 8\text{ USB drive} = 58$. Choose the latter as the more expensive option and return `58`.

---

### Function Description
Complete the `getMoneySpent` function below.

`getMoneySpent` has the following parameter(s):
- `int keyboards[n]`: the keyboard prices
- `int drives[m]`: the drive prices
- `int b`: the budget

**Returns:**
- `int`: the maximum that can be spent, or `-1` if it is not possible to buy both items.

---

### Input Format
- The first line contains three space-separated integers $b$, $n$, and $m$: the budget, the number of keyboard models, and the number of USB drive models.
- The second line contains $n$ space-separated integers $keyboards[i]$: the prices of each keyboard model.
- The third line contains $m$ space-separated integers $drives[j]$: the prices of the USB drives.

### Constraints
- $1 \le n, m \le 1000$
- $1 \le b \le 10^6$
- The price of each item is in the inclusive range $[1, 10^6]$.

---

### Sample Test Cases

#### Sample 0
**Input:**
```text
10 2 3
3 1
5 2 8
```
**Output:**
```text
9
```
*Explanation:* Buy the $1 keyboard and the $8 USB drive for a total cost of $9.

#### Sample 1
**Input:**
```text
5 1 1
4
5
```
**Output:**
```text
-1
```
*Explanation:* There is no way to buy one keyboard and one USB drive because $4 + 5 > 5$, so return -1.

---

### Python 3 Solution

```python
import os
import sys

def getMoneySpent(keyboards, drives, b):
    # Sắp xếp bàn phím giảm dần và ổ USB tăng dần
    keyboards.sort(reverse=True)
    drives.sort()
    
    max_spent = -1
    i = 0  # Duyệt keyboards
    j = 0  # Duyệt drives
    
    # Kỹ thuật hai con trỏ (Two Pointers) O(n log n + m log m)
    while i < len(keyboards) and j < len(drives):
        total = keyboards[i] + drives[j]
        
        if total > b:
            # Vượt quá ngân sách -> thử bàn phím rẻ hơn
            i += 1
        else:
            # Thỏa mãn ngân sách -> ghi nhận kỷ lục và thử USB đắt hơn
            if total > max_spent:
                max_spent = total
            j += 1
            
    return max_spent

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    bnm = input().split()
    b = int(bnm[0])
    n = int(bnm[1])
    m = int(bnm[2])

    keyboards = list(map(int, input().rstrip().split()))
    drives = list(map(int, input().rstrip().split()))

    moneySpent = getMoneySpent(keyboards, drives, b)
    fptr.write(str(moneySpent) + '\n')
    fptr.close()
```
