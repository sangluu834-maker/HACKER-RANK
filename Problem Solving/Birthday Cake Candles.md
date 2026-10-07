# Birthday Cake Candles

You are in charge of the cake for a child's birthday. It will have one candle for each year of their total age. They will only be able to blow out the tallest of the candles. Your task is to count how many candles are the tallest.

For example, if `candles = [4, 4, 1, 3]`, the tallest candles are `4` units high. There are `2` candles with this height, so the function should return `2`.

---

### Function Description

Complete the `birthdayCakeCandles` function in the editor below. It should return the number of candles that are the tallest.

`birthdayCakeCandles` has the following parameter(s):
- `candles`: an array of integers representing candle heights

**Returns:**
- `int`: the number of candles that are tallest

---

### Input & Output Format

- **Input:**
  - The first line contains a single integer `n`, the size of `candles`.
  - The second line contains `n` space-separated integers, where each integer describes the height of `candles[i]`.
- **Output:**
  - Print the count of the tallest candles.

---

### Sample Test

| Input | Output | Explanation |
| :--- | :--- | :--- |
| `4`<br>`3 2 1 3` | `2` | Candle heights are `[3, 2, 1, 3]`. The tallest candles are `3` units high, and there are `2` of them. |

---

### Solution (Python 3)

```python
import sys

def birthdayCakeCandles(candles):   
    chieu_cao_max = max(candles)    
    so_luong = candles.count(chieu_cao_max)    
    return so_luong

if __name__ == '__main__':    
    candles_count = int(input().strip())   
    candles = list(map(int, input().rstrip().split()))    
    result = birthdayCakeCandles(candles)
    print(result)
