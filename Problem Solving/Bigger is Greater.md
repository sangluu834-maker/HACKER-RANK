# Bigger is Greater

Lexicographical order is often known as alphabetical order when dealing with strings. A string is greater than another string if it comes later in a lexicographically sorted list.

Given a word, create a new word by swapping some or all of its characters. This new word must meet two criteria:
- It must be greater than the original word.
- It must be the smallest word that meets the first condition.

---

### Example
- $w = \text{"abcd"}$

The next largest word is `"abdc"`.

Complete the function `biggerIsGreater` below to create and return the new string meeting the criteria. If it is not possible, return `no answer`.

---

### Function Description
Complete the `biggerIsGreater` function below.

`biggerIsGreater` has the following parameter(s):
- `string w`: a word

**Returns:**
- `string`: the smallest lexicographically higher string possible or `'no answer'`.

---

### Input Format
- The first line of input contains $T$, the number of test cases.
- Each of the next $T$ lines contains $w$.

### Constraints
- $1 \le T \le 10^5$
- $1 \le \vert{}w\vert{} \le 100$
- $w$ will contain only letters in the range `ascii[a..z]`.

---

### Sample Test Cases

#### Sample Input 0
```text
5
ab
bb
hefg
dhck
dkhc
```

#### Sample Output 0
```text
ba
no answer
hegf
dhkc
hcdk
```

**Explanation 0:**
- Test case 1: `ba` is the only string which can be made by rearranging `ab`. It is greater.
- Test case 2: It is not possible to rearrange `bb` and get a greater string $\rightarrow$ `no answer`.
- Test case 3: `hegf` is the next string greater than `hefg`.
- Test case 4: `dhkc` is the next string greater than `dhck`.
- Test case 5: `hcdk` is the next string greater than `dkhc`.

#### Sample Input 1
```text
6
lmno
dcba
dcbb
abdc
abcd
fedcbabcd
```

#### Sample Output 1
```text
lmon
no answer
no answer
acbd
abdc
fedcbabdc
```

---

### Python 3 Solution

> **Ý tưởng thuật toán (Next Lexicographical Permutation):**
> Bài toán tương đương với việc tìm hoán vị kế tiếp theo thứ tự từ điển của chuỗi $w$:
> 1. **Tìm điểm gãy (Pivot):** Duyệt từ phải sang trái để tìm chỉ số $i$ lớn nhất sao cho $w[i] < w[i + 1]$.
>    - Nếu không tồn tại $i$ như vậy (chuỗi đang giảm dần hoàn toàn, ví dụ `"dcba"`), thì đây đã là hoán vị lớn nhất $\rightarrow$ trả về `"no answer"`.
> 2. **Tìm phần tử thay thế (Successor):** Duyệt từ phải sang trái đến vị trí $i + 1$ để tìm chỉ số $j$ lớn nhất sao cho $w[j] > w[i]$.
> 3. **Hoán đổi:** Đổi chỗ $w[i]$ và $w[j]$.
> 4. **Sắp xếp tăng dần phần đuôi:** Vì đoạn con từ $i + 1$ đến cuối mảng đang giảm dần, ta chỉ cần **đảo ngược** đoạn `w[i + 1:]` để nó trở thành thứ tự tăng dần nhỏ nhất.
> - Độ phức tạp thời gian: $O(\vert{}w\vert{})$, không gian: $O(\vert{}w\vert{})$.

```python
import os
import sys

def biggerIsGreater(w):
    arr = list(w)
    n = len(arr)
    
    # Bước 1: Tìm chỉ số i lớn nhất từ phải sang trái sao cho arr[i] < arr[i + 1]
    i = n - 2
    while i >= 0 and arr[i] >= arr[i + 1]:
        i -= 1
        
    # Nếu chuỗi đã xếp giảm dần hoàn toàn thì không có hoán vị lớn hơn
    if i == -1:
        return "no answer"
        
    # Bước 2: Tìm chỉ số j lớn nhất từ phải sang trái sao cho arr[j] > arr[i]
    j = n - 1
    while arr[j] <= arr[i]:
        j -= 1
        
    # Bước 3: Hoán đổi arr[i] và arr[j]
    arr[i], arr[j] = arr[j], arr[i]
    
    # Bước 4: Đảo ngược phần hậu tố sau vị trí i để thu được chuỗi nhỏ nhất có thể
    arr[i + 1:] = reversed(arr[i + 1:])
    
    return "".join(arr)

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    T = int(input().strip())

    for T_itr in range(T):
        w = input()

        result = biggerIsGreater(w)

        fptr.write(result + '\n')

    fptr.close()
```
