# Day of the Programmer

Marie invented a Time Machine and wants to test it by time-traveling to visit Russia on the Day of the Programmer (the 256th day of the year) during a year in the inclusive range from 1700 to 2700.

From 1700 to 1917, Russia's official calendar was the Julian calendar; since 1919 they used the Gregorian calendar system. The transition occurred in 1918, when February 14th was the 32nd day of the year (skipping 13 days).

- **Julian Calendar (1700 - 1917):** Leap years are divisible by 4.
- **Gregorian Calendar (1919 - 2700):** Leap years are divisible by 400, or divisible by 4 and not divisible by 100.
- **Transition Year (1918):** February had only 15 days (February 14 to February 28).

---

### Function Description

Complete the `dayOfProgrammer` function in the editor below.

`dayOfProgrammer` has the following parameter(s):
- `year`: an integer representing the year

**Returns:**
- `string`: the date of the 256th day of the year formatted as `dd.mm.yyyy`.

---

### Input & Output Format

- **Input:**
  - A single integer denoting `year` ($1700 \le year \le 2700$).
- **Output:**
  - Print the full date of Day of the Programmer in the format `dd.mm.yyyy`.

---

### Sample Tests

| Input | Output | Explanation |
| :--- | :--- | :--- |
| `2017` | `13.09.2017` | Non-leap year in the Gregorian calendar ($256 - 243 = 13$). |
| `2016` | `12.09.2016` | Leap year in the Gregorian calendar ($256 - 244 = 12$). |
| `1800` | `12.09.1800` | Leap year in the Julian calendar (divisible by 4). |
| `1918` | `26.09.1918` | Transition year (skipping 13 days in February). |

---

### Solution (Python 3)

```python
import sys

def dayOfProgrammer(year):
    # Transition year: February had only 15 days (Feb 14 to Feb 28)
    if year == 1918:
        return '26.09.1918'
    
    # Check for leap year in Julian (< 1918) and Gregorian (> 1918)
    is_julian_leap = year < 1918 and (year % 4 == 0)
    is_gregorian_leap = year > 1918 and (year % 400 == 0 or (year % 4 == 0 and year % 100 != 0))
    
    if is_julian_leap or is_gregorian_leap:
        return f'12.09.{year}'
    else:
        return f'13.09.{year}'

if __name__ == '__main__':
    year = int(input().strip())
    result = dayOfProgrammer(year)
    print(result)
