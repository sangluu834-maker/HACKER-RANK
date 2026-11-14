# ACM ICPC Team

There are a number of people who will be attending ACM-ICPC World Finals. Each of them may be well versed in a number of topics. Given a list of topics known by each attendee, presented as binary strings, determine the maximum number of topics a 2-person team can know. Each subject has a column in the binary string, and a `'1'` means the subject is known while `'0'` means it is not. Also determine the number of teams that know the maximum number of topics. Return an integer array with two elements. The first is the maximum number of topics known, and the second is the number of teams that know that number of topics.

---

### Example
- $n = 3, m = 5$
- $\text{topic} = [\text{"10101"}, \text{"11110"}, \text{"00010"}]$

All possible 2-person teams:
- $(1, 2) \rightarrow \text{subjects } [1, 2, 3, 4, 5]$ ($5$ topics)
- $(1, 3) \rightarrow \text{subjects } [1, 3, 4, 5]$ ($4$ topics)
- $(2, 3) \rightarrow \text{subjects } [1, 2, 3, 4]$ ($4$ topics)

The maximum number of topics is $5$, and only $1$ team knows all $5$ topics $\rightarrow$ return `[5, 1]`.

---

### Function Description
Complete the `acmTeam` function below.

`acmTeam` has the following parameter(s):
- `string topic[n]`: a string of binary digits for each attendee

**Returns:**
- `int[2]`: the maximum topics and the number of teams that know that many topics.

---

### Input Format
- The first line contains two space-separated integers $n$ and $m$, where $n$ is the number of attendees and $m$ is the number of topics.
- Each of the next $n$ lines contains a binary string of length $m$.

### Constraints
- $2 \le n \le 500$
- $1 \le m \le 500$

---

### Sample Test Cases

#### Sample Input
```text
4 5
10101
11100
11010
00101
```

#### Sample Output
```text
5
2
```

**Explanation:**
- Team $(1, 2) \rightarrow 4$ topics
- Team $(1, 3) \rightarrow 5$ topics
- Team $(1, 4) \rightarrow 3$ topics
- Team $(2, 3) \rightarrow 4$ topics
- Team $(2, 4) \rightarrow 4$ topics
- Team $(3, 4) \rightarrow 5$ topics

The $2$ teams $(1, 3)$ and $(3, 4)$ know all $5$ topics, which is maximal.

---

### Python 3 Solution

> **Ý tưởng tối ưu bằng Bitwise OR:**
> - Thay vì duyệt từng ký tự từ $0$ đến $m - 1$ cho mỗi cặp thí sinh (mất $O(n^2 \cdot m)$), ta chuyển mỗi chuỗi nhị phân thành một số nguyên cơ số 2: `int(t, 2)`.
> - Khi ghép đôi 2 thí sinh $i$ và $j$, tập hợp các chủ đề cả đội biết chính là phép toán **Bitwise OR**: `masks[i] | masks[j]`.
> - Số lượng chủ đề đội đó biết là số bit `1` trong kết quả phép OR (dùng `.bit_count()` trong Python 3.10+ hoặc `bin(...).count('1')`).
> - Duyệt qua tất cả các cặp $(i, j)$ với $0 \le i < j < n$ để cập nhật `max_topics` và đếm số đội đạt được mức tối đa đó.

```python
import os
import sys

def acmTeam(topic):
    n = len(topic)
    # Chuyển mỗi chuỗi nhị phân thành số nguyên (bitmask) để thực hiện phép OR cực nhanh
    masks = [int(t, 2) for t in topic]
    
    max_topics = 0
    team_count = 0
    
    for i in range(n):
        for j in range(i + 1, n):
            # Tổng hợp chủ đề của 2 thành viên bằng phép Bitwise OR và đếm số bit 1
            known = bin(masks[i] | masks[j]).count('1')
            
            if known > max_topics:
                max_topics = known
                team_count = 1
            elif known == max_topics:
                team_count += 1
                
    return [max_topics, team_count]

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    first_multiple_input = input().rstrip().split()

    n = int(first_multiple_input[0])
    m = int(first_multiple_input[1])

    topic = []
    for _ in range(n):
        topic_item = input()
        topic.append(topic_item)

    result = acmTeam(topic)

    fptr.write('\n'.join(map(str, result)))
    fptr.write('\n')

    fptr.close()
```
