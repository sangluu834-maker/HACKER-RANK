# Grading Students

HackerLand University has the following grading policy:
- Every student receives a `grade` in the range from `0` to `100`.
- Any `grade` less than `40` is a failing grade.

Sam rounds each student's `grade` according to these rules:
- If the difference between the `grade` and the next multiple of `5` is less than `3`, round `grade` up to the next multiple of `5`.
- If the value of `grade` is less than `38`, no rounding occurs as the result will still be a failing grade.

---

### Examples

- `grade = 84` $\to$ round to `85` ($85 - 84 = 1 < 3$).
- `grade = 29` $\to$ do not round (result $< 38$).
- `grade = 57` $\to$ do not round ($60 - 57 = 3 \ge 3$).

---

### Function Description

Complete the `gradingStudents` function in the editor below.

`gradingStudents` has the following parameter(s):
- `grades`: an array of integers representing the grades before rounding

**Returns:**
- `int[]`: the grades after rounding

---

### Input & Output Format

- **Input:**
  - The first line contains an integer $n$, the number of students.
  - Each of the subsequent $n$ lines contains a single integer representing a student's grade.
- **Output:**
  - Print each rounded grade on a new line.

---

### Sample Test

| Input | Output | Explanation |
| :--- | :--- | :--- |
| `4`<br>`73`<br>`67`<br>`38`<br>`33` | `75`<br>`67`<br>`40`<br>`33` | `73` rounded to `75` ($75-73=2 < 3$)<br>`67` unchanged ($70-67=3$)<br>`38` rounded to `40` ($40-38=2 < 3$)<br>`33` unchanged ($< 38$) |

---

### Solution (Python 3)

```python
import sys

def gradingStudents(grades):
    danh_sach_diem_moi = []
    
    for diem in grades:
        if diem >= 38 and diem % 5 >= 3:
            diem_moi = diem + (5 - (diem % 5))
            danh_sach_diem_moi.append(diem_moi)
        else:
            danh_sach_diem_moi.append(diem)
            
    return danh_sach_diem_moi

if __name__ == '__main__':
    n = int(input().strip())
    grades = [int(input().strip()) for _ in range(n)]
        
    result = gradingStudents(grades)
    for r in result:
        print(r)
