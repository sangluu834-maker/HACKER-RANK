# Plus Minus

Given an array of integers, calculate the ratios of its elements that are positive, negative, and zero. Print the decimal value of each fraction on a new line with 6 places after the decimal.

---

### Function Description

Complete the `plusMinus` function in the editor below.

`plusMinus` has the following parameter(s):
- `arr`: an array of integers

**Print:**
- Print the ratios of positive, negative, and zero values in the array. Each value should be printed on a separate line with 6 digits after the decimal. No value should be returned.

---

### Input & Output Format

- **Input:**
  - The first line contains an integer $n$, the size of the array.
  - The second line contains $n$ space-separated integers describing `arr`.
- **Output:**
  - Print the 3 fractions on 3 separate lines with 6 decimal places:
    1. Proportion of positive values
    2. Proportion of negative values
    3. Proportion of zeros

---

### Sample Test

| Input | Output | Explanation |
| :--- | :--- | :--- |
| `6`<br>`-4 3 -9 0 4 1` | `0.500000`<br>`0.333333`<br>`0.166667` | 3 positive values ($3/6 = 0.500000$)<br>2 negative values ($2/6 = 0.333333$)<br>1 zero ($1/6 = 0.166667$) |

---

### Solution (Python 3)

```python
import sys

def plusMinus(arr):
    n = len(arr)
    pos_count = 0
    neg_count = 0
    zero_count = 0   
    
    for num in arr:
        if num > 0:
            pos_count += 1
        elif num < 0:
            neg_count += 1
        else:
            zero_count += 1 
            
    print(f"{pos_count / n:.6f}")
    print(f"{neg_count / n:.6f}")
    print(f"{zero_count / n:.6f}")

if __name__ == '__main__':
    n = int(input().strip())
    arr = list(map(int, input().rstrip().split())) 
    plusMinus(arr)
