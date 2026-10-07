# Time Conversion

Given a time in 12-hour AM/PM format, convert it to military (24-hour) time.

Note:
- `12:00:00AM` on a 12-hour clock is `00:00:00` on a 24-hour clock.
- `12:00:00PM` on a 12-hour clock is `12:00:00` on a 24-hour clock.

---

### Function Description

Complete the `timeConversion` function in the editor below.

`timeConversion` has the following parameter(s):
- `s`: a time in 12-hour format string (e.g., `hh:mm:ssAM` or `hh:mm:ssPM`)

**Returns:**
- `string`: the time in 24-hour format

---

### Input & Output Format

- **Input:**
  - A single string `s` representing a valid time in 12-hour format.
- **Output:**
  - Print the converted 24-hour format string.

---

### Sample Test

| Input | Output | Explanation |
| :--- | :--- | :--- |
| `07:05:45PM` | `19:05:45` | Adding 12 to 7 gives hour 19. |
| `12:01:00PM` | `12:01:00` | 12 PM remains 12:01:00. |
| `12:01:00AM` | `00:01:00` | 12 AM changes to 00:01:00. |

---

### Solution (Python 3)

```python
import sys

def timeConversion(s):   
    am_pm = s[-2:]        
    gio = int(s[:2])       
    phut_giay = s[2:-2]       
    
    if am_pm == "AM":
        if gio == 12:
            gio_moi = "00"
        else:
            gio_moi = s[:2] 
    else: 
        if gio == 12:
            gio_moi = "12"
        else:
            gio_moi = str(gio + 12)   
            
    return gio_moi + phut_giay

if __name__ == '__main__':   
    s = input().strip()   
    result = timeConversion(s)
    print(result)
