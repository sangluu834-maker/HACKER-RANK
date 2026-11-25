# Encryption

An English text needs to be encrypted using the following encryption scheme. First, the spaces are removed from the text. Let $L$ be the length of this text. Then, characters are written into a grid, whose rows and columns have the following constraints:
$$\lfloor\sqrt{L}\rfloor \le \text{rows} \le \text{columns} \le \lceil\sqrt{L}\rceil$$
- Ensure that $\text{rows} \times \text{columns} \ge L$.
- If multiple grids satisfy the above conditions, choose the one with the minimum area, i.e., $\text{rows} \times \text{columns}$.

The encoded message is obtained by displaying the characters of each column, with a space between column texts.

---

### Example
$s = \text{"if man was meant to stay on the ground god would have given us roots"}$

After removing spaces, the string is $L = 54$ characters long. $\sqrt{54}$ is between $7$ and $8$, so it is written in the form of a grid with $7$ rows and $8$ columns:
```text
ifmanwas
meanttos
tayonthe
groundgo
dwouldha
vegivenu
sroots
```

The encoded message for the grid above is:
```text
imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn sseoau
```

---

### Function Description
Complete the `encryption` function below.

`encryption` has the following parameter(s):
- `string s`: a string to encrypt

**Returns:**
- `string`: the encrypted string.

---

### Input Format
One line of text, the string $s$.

### Constraints
- $1 \le \text{length of } s \le 81$
- $s$ contains characters in the range `ascii[a-z]` and space, `ascii(32)`.

---

### Sample Test Cases

#### Sample Input 0
```text
haveaniceday
```

#### Sample Output 0
```text
hae and via ecy
```

**Explanation 0:**
$L = 12$, $\sqrt{12}$ is between $3$ and $4$. Rewritten with $3$ rows and $4$ columns:
```text
have
anic
eday
```

#### Sample Input 1
```text
feedthedog    
```

#### Sample Output 1
```text
fto ehg ee dd
```

**Explanation 1:**
$L = 10$, $\sqrt{10}$ is between $3$ and $4$. Rewritten with $3$ rows and $4$ columns:
```text
feed
thed
og
```

#### Sample Input 2
```text
chillout
```

#### Sample Output 2
```text
clu hlt io
```

**Explanation 2:**
$L = 8$, $\sqrt{8}$ is between $2$ and $3$. Rewritten with $3$ columns and $3$ rows ($2 \times 3 = 6 < 8$ so we have to use $3 \times 3$):
```text
chi
llo
ut
```

---

### Python 3 Solution

> **Ý tưởng:**
> 1. Loại bỏ toàn bộ khoảng trắng trong chuỗi $s$: `s = s.replace(" ", "")`. Lấy độ dài $L = \text{len}(s)$.
> 2. Tính số cột tối ưu: $\text{cols} = \lceil\sqrt{L}\rceil = \text{math.ceil}(\sqrt{L})$. (Lưu ý: Khi đọc theo từng cột bằng slicing bước nhảy `cols`, ta không cần phải dựng mảng 2 chiều thực sự hay quan tâm số hàng).
> 3. Với mỗi chỉ số cột $c$ từ $0$ đến $\text{cols} - 1$, lấy các ký tự bắt đầu từ vị trí $c$ với bước nhảy là `cols`: `s[c::cols]`.
> 4. Nối các chuỗi thu được của từng cột bằng dấu cách `' '`.

```python
import math
import os
import sys

def encryption(s):
    # Loại bỏ toàn bộ khoảng trắng
    s = s.replace(" ", "")
    L = len(s)
    
    # Số cột tối ưu luôn là ceil(sqrt(L)) để đảm bảo diện tích nhỏ nhất mà rows * cols >= L
    cols = math.ceil(math.sqrt(L))
    
    # Dùng string slicing bước nhảy `cols` để trích xuất từng cột
    encrypted_columns = [s[c::cols] for c in range(cols)]
    
    return " ".join(encrypted_columns)

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    s = input()

    result = encryption(s)

    fptr.write(result + '\n')
    fptr.close()
```
