# Append and Delete

You have two strings of lowercase English letters. You can perform two types of operations on the first string:
1. Append a lowercase English letter to the end of the string.
2. Delete the last character of the string. Performing this operation on an empty string results in an empty string.

Given an integer $k$, and two strings $s$ and $t$, determine whether or not you can convert $s$ to $t$ by performing **exactly** $k$ of the above operations on $s$. If it's possible, print `Yes`. Otherwise, print `No`.

---

### Example
- $s = \text{"abc"}$
- $t = \text{"def"}$
- $k = 6$

To convert $s$ to $t$, we first delete all $3$ characters of $s$ in $3$ moves. Next we append each of the $3$ characters of $t$ in order. On the $6^{\text{th}}$ move, the strings match $\rightarrow$ Return `Yes`.

If there were more moves available (e.g. $k = 7$ or more), we could perform excess deletions on an empty string since deleting an empty string results in an empty string.

---

### Function Description
Complete the `appendAndDelete` function below.

`appendAndDelete` has the following parameter(s):
- `string s`: the initial string
- `string t`: the desired string
- `int k`: the exact number of operations that must be performed

**Returns:**
- `string`: either `'Yes'` or `'No'`.

---

### Input Format
- The first line contains a string $s$, the initial string.
- The second line contains a string $t$, the desired final string.
- The third line contains an integer $k$, the number of operations.

### Constraints
- $1 \le \vert{}s\vert{} \le 100$
- $1 \le \vert{}t\vert{} \le 100$
- $1 \le k \le 100$
- $s$ and $t$ consist of lowercase English letters, `[a-z]`.

---

### Sample Test Cases

#### Sample Input 0
```text
hackerhappy
hackerrank
9
```

#### Sample Output 0
```text
Yes
```

**Explanation:**
Common prefix is `"hacker"` (length $6$).
- Delete $5$ characters from $s$ (`"happy"`).
- Append $4$ characters of $t$ (`"rank"`).
- Total minimum moves = $5 + 4 = 9 = k \rightarrow$ `Yes`.

#### Sample Input 1
```text
aba
aba
7
```

#### Sample Output 1
```text
Yes
```

**Explanation:**
$k = 7 \ge \vert{}s\vert{} + \vert{}t\vert{} = 3 + 3 = 6$. We can delete all characters of $s$ down to the empty string, execute redundant delete operations on the empty string, and append $t \rightarrow$ `Yes`.

#### Sample Input 2
```text
ashley
ash
2
```

#### Sample Output 2
```text
No
```

**Explanation:**
To convert `"ashley"` to `"ash"`, we need at least $3$ delete operations. Since $2 < 3$, it's impossible $\rightarrow$ `No`.

---

### Python 3 Solution

> **Ý tưởng:**
> 1. Tìm độ dài tiền tố chung dài nhất (Longest Common Prefix - LCP) giữa $s$ và $t$, gọi là `common_len`.
> 2. Số thao tác tối thiểu cần thực hiện để biến $s$ thành $t$:
>    $$\text{min\_ops} = (\vert{}s\vert{} - \text{common\_len}) + (\vert{}t\vert{} - \text{common\_len})$$
> 3. Ta có thể đạt được đúng $k$ thao tác trong 2 trường hợp:
>    - **Trường hợp 1:** $k \ge \vert{}s\vert{} + \vert{}t\vert{}$. Khi đó ta có thể xóa sạch toàn bộ chuỗi $s$ thành chuỗi rỗng, thực hiện các thao tác xóa dư thừa trên chuỗi rỗng (chuỗi vẫn rỗng), rồi sau đó thêm các ký tự của $t$.
