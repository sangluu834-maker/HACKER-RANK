# Designer PDF Viewer

When a contiguous block of text is selected in a PDF viewer, the selection is highlighted with a blue rectangle. In this PDF viewer, each word is highlighted independently.

There is a list of $26$ character heights aligned by index to their letters. For example, `'a'` is at index $0$ and `'z'` is at index $25$. There will also be a string. Using the letter heights given, determine the area of the rectangle highlight in $\text{mm}^2$ assuming all letters are $1\text{mm}$ wide.

---

### Example
- $h = [1, 3, 1, 3, 1, 4, 1, 3, 2, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5]$
- $word = \text{'torn'}$

The heights for each letter are:
- $t = 2$
- $o = 5$
- $r = 5$
- $n = 5$

The tallest letter has height $5$ and there are $4$ letters. The highlighted area is $4 \times 1 \times 5 = 20\text{ mm}^2$. Return `20`.

---

### Function Description
Complete the `designerPdfViewer` function below.

`designerPdfViewer` has the following parameter(s):
- `int h[26]`: the heights of each letter in alphabetical order (`'a'` through `'z'`)
- `string word`: a string consisting of lowercase English letters

**Returns:**
- `int`: the size of the highlighted area

---

### Input Format
- The first line contains $26$ space-separated integers describing the heights of each lowercase English letter (`a-z`).
- The second line contains a single string `word`.

### Constraints
- $1 \le h[?] \le 7$, where $?$ is an English lowercase letter.
- `word` contains no more than $10$ lowercase English letters.

---

### Sample Test Cases

#### Sample Input 0
```text
1 3 1 3 1 4 1 3 2 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
abc
```

#### Sample Output 0
```text
9
```
*Explanation:* Letter heights for `a`, `b`, `c` are $1$, $3$, and $1$. The tallest letter is $3$ high, and the word length is $3$. Area = $3 \times 3 = 9$.

#### Sample Input 1
```text
1 3 1 3 1 4 1 3 2 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 7
zaba
```

#### Sample Output 1
```text
28
```
*Explanation:* The tallest letter in `zaba` is `z` at height $7$. The length of the word is $4$. Area = $4 \times 7 = 28$.

---

### Python 3 Solution

> **Ý tưởng:** 
> - Chiều rộng của mỗi ký tự là $1$, nên chiều dài vùng chọn là `len(word)`.
> - Chiều cao vùng chọn là chiều cao của ký tự cao nhất trong `word`, tra cứu theo công thức chỉ số: `ord(char) - ord('a')`.
> - Diện tích = `len(word) * max_height`.

```python
import os
import sys

def designerPdfViewer(h, word):
    # Tìm chiều cao lớn nhất của các chữ cái trong word
    max_h = max(h[ord(char) - ord('a')] for char in word)
    
    # Diện tích = số lượng chữ cái * chiều rộng (1) * chiều cao lớn nhất
    return len(word) * max_h

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    h = list(map(int, input().rstrip().split()))
    word = input()

    result = designerPdfViewer(h, word)

    fptr.write(str(result) + '\n')
    fptr.close()
```
