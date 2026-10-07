# Bill Division

Two friends Anna and Brian, are deciding how to split the bill at a dinner. Each will only pay for the items they consume. Brian gets the check and calculates Anna's portion. You must determine if his calculation is correct.

For example, assume the bill has the following prices: `bill = [3, 10, 2, 9]`. Anna declines to eat item `k = 1` which costs `10`. If Brian calculates the bill correctly, Anna will pay `(3 + 2 + 9) / 2 = 7`. If he includes the cost of the item she didn't eat, he will calculate `(3 + 10 + 2 + 9) / 2 = 12`. In the second case, he should refund `12 - 7 = 5` to Anna.

---

### Function Description

Complete the `bonAppetit` function in the editor below. It should print `Bon Appetit` if the bill is fairly split. Otherwise, it should print the integer amount of money that Brian owes Anna.

`bonAppetit` has the following parameter(s):
- `bill`: an array of integers representing the cost of each item ordered
- `k`: an integer representing the zero-based index of the item Anna doesn't eat
- `b`: the amount of money that Anna contributed to the bill

---

### Input & Output Format

- **Input:**
  - The first line contains two space-separated integers `n` and `k`.
  - The second line contains `n` space-separated integers where `bill[i]` is the cost of each item.
  - The third line contains an integer `b`, the amount of money that Brian charged Anna.
- **Output:**
  - Print `Bon Appetit` if the bill is split fairly; otherwise, print the integer amount Brian must refund to Anna.

---

### Sample Tests

| Input | Output | Explanation |
| :--- | :--- | :--- |
| `4 1`<br>`3 10 2 9`<br>`12` | `5` | Anna didn't eat item `bill[1] = 10`. Shared total is `14`, her share is `7`. Brian charged `12`, so he owes `12 - 7 = 5`. |
| `4 1`<br>`3 10 2 9`<br>`7` | `Bon Appetit` | Anna's share is `7`, which matches what Brian charged. |

---

### Solution (Python 3)

```python
import sys

def bonAppetit(bill, k, b):
    # Calculate total of shared items excluding item at index k
    total_shared_cost = sum(bill) - bill[k]
    actual_share = total_shared_cost // 2
    
    # Check if bill was calculated correctly
    if b == actual_share:
        print("Bon Appetit")
    else:
        print(b - actual_share)

if __name__ == '__main__':
    first_line = input().rstrip().split()
    n = int(first_line[0])
    k = int(first_line[1])
    
    bill = list(map(int, input().rstrip().split()))
    b = int(input().strip())
    
    bonAppetit(bill, k, b)
