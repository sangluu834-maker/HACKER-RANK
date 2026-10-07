# Migratory Birds

Given an array of bird sightings where every element represents a bird type id, determine the id of the most frequently sighted type. If more than one type has been spotted that maximum amount, return the smallest of their ids.

---

### Function Description

Complete the `migratoryBirds` function in the editor below.

`migratoryBirds` has the following parameter(s):
- `arr`: an array of integers representing types of birds sighted (guaranteed to be types 1, 2, 3, 4, or 5)

**Returns:**
- `int`: the lowest type id of the most frequently sighted birds.

---

### Input & Output Format

- **Input:**
  - The first line contains an integer $n$, the size of `arr`.
  - The second line contains $n$ space-separated integers describing `arr`.
- **Output:**
  - Print the smallest type id that occurs with maximum frequency.

---

### Sample Tests

| Input | Output | Explanation |
| :--- | :--- | :--- |
| `6`<br>`1 4 4 4 5 3` | `4` | Type 4 occurs 3 times, which is the highest frequency. |
| `11`<br>`1 2 3 4 5 4 3 2 1 3 4` | `3` | Types 3 and 4 both appear 3 times. Type 3 is returned because $3 < 4$. |

---

### Solution (Python 3)

```python
import sys

def migratoryBirds(arr):
    # Bird types are from 1 to 5, use frequency array of size 6
    counts = [0] * 6
    for bird in arr:
        counts[bird] += 1
        
    max_count = max(counts)
    
    # Return the first type (smallest id) matching max_count
    for i in range(1, 6):
        if counts[i] == max_count:
            return i

if __name__ == '__main__':
    arr_count = int(input().strip())
    arr = list(map(int, input().rstrip().split()))
    
    result = migratoryBirds(arr)
    print(result)
