# Breaking the Records
Maria plays college basketball and wants to go pro. Each season she maintains a record of her play. She tabulates the number of times she breaks her season record for most points and least points in a game. Points scored in the first game establish her record for the season, and she begins counting from there.

Given the scores for a season, determine the number of times Maria breaks her records for most and least points scored during the season.
---
### Example
`scores = [12, 24, 10, 24]`
| Game | Score | Minimum | Maximum | Min Count | Max Count |
| :---: | :---: | :---: | :---: | :---: | :---: |
| 0 | 12 | 12 | 12 | 0 | 0 |
| 1 | 24 | 12 | 24 | 0 | 1 |
| 2 | 10 | 10 | 24 | 1 | 1 |
| 3 | 24 | 10 | 24 | 1 | 1 |
Result: `[1, 1]`
---
### Function Description

Complete the `breakingRecords` function in the editor below.

`breakingRecords` has the following parameter(s):
- `scores`: an array of integers representing points scored per game

**Returns:**
- `int[2]`: An array with the numbers of times she broke her records. Index `0` is for breaking most points records, and index `1` is for breaking least points records.
---
### Input & Output Format
- **Input:**
  - The first line contains an integer `n`, the number of games.
  - The second line contains `n` space-separated integers describing the respective values of `scores`.
- **Output:**
  - Print two space-separated integers representing the number of times she broke her records for most and least points.
---
### Sample Tests
| Input | Output | Explanation |
| :--- | :--- | :--- |
| `9`<br>`10 5 20 20 4 5 2 25 1` | `2 4` | Maria broke her best record twice and her worst record 4 times. |
| `10`<br>`3 4 21 36 10 28 35 5 24 42` | `4 0` | Maria broke her best record 4 times and never broke her worst record. |
---
### Solution (Python 3)
```python
import sys
def breakingRecords(scores):
    min_score = scores[0]
    max_score = scores[0]
    min_count = 0
    max_count = 0
    
    for score in scores[1:]:
        if score > max_score:
            max_score = score
            max_count += 1
        elif score < min_score:
            min_score = score
            min_count += 1
            
    return [max_count, min_count]

if __name__ == '__main__':
    n = int(input().strip())
    scores = list(map(int, input().rstrip().split()))

    result = breakingRecords(scores)
    print(' '.join(map(str, result)))
