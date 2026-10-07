# Between Two Sets

- **Nền tảng:** [HackerRank](https://www.hackerrank.com/)
- **Chủ đề:** Algorithms > Implementation
- **Độ khó:** Easy
- **Ngôn ngữ:** Python 3

---

## 📌 Đề bài

Cho hai mảng số nguyên $a$ và $b$. Hãy tìm tất cả các số nguyên $x$ thỏa mãn đồng thời hai điều kiện sau:
1. Tất cả các phần tử trong mảng $a$ đều là ước của $x$ ($x$ chia hết cho mọi phần tử trong $a$).
2. $x$ là ước của tất cả các phần tử trong mảng $b$ (mọi phần tử trong $b$ đều chia hết cho $x$).

Số thỏa mãn được gọi là nằm giữa hai mảng. Nhiệm vụ của bạn là đếm xem có bao nhiêu số như vậy.

### Ví dụ
- $a = [2, 4]$
- $b = [16, 32, 96]$

Các số thỏa mãn:
- $4$: Chia hết cho $2, 4$ và là ước của $16, 32, 96$.
- $8$: Chia hết cho $2, 4$ và là ước của $16, 32, 96$.
- $16$: Chia hết cho $2, 4$ và là ước của $16, 32, 96$.

Kết quả trả về: `3` (gồm các số $4, 8, 16$).

### Mô tả hàm
Hàm `getTotalX` nhận các tham số:
- `a`: Mảng số nguyên $a$
- `b`: Mảng số nguyên $b$

**Giá trị trả về:**
- Số lượng số nguyên thỏa mãn điều kiện (`int`).

### Định dạng dữ liệu
- **Input:**
  - Dòng 1: Hai số nguyên $n$ và $m$ cách nhau bởi dấu cách (kích thước của mảng $a$ và $b$).
  - Dòng 2: $n$ số nguyên phân biệt của mảng $a$.
  - Dòng 3: $m$ số nguyên phân biệt của mảng $b$.
- **Output:**
  - In ra số lượng các số thỏa mãn.

---

## 💡 Ý tưởng giải thuật & Phân tích

### 1. Phân tích toán học
Để số nguyên $x$ thỏa mãn bài toán:
- $x$ chia hết cho mọi phần tử của $a$ $\Rightarrow$ $x$ phải là **bội số của Bội chung nhỏ nhất (LCM)** của toàn bộ mảng $a$:
  $$x = k \times \text{LCM}(a) \quad (k \ge 1)$$
- Mọi phần tử của $b$ đều chia hết cho $x$ $\Rightarrow$ $x$ phải là **ước của Ước chung lớn nhất (GCD)** của toàn bộ mảng $b$:
  $$\text{GCD}(b) \pmod x = 0$$

### 2. Thuật toán
1. Tính $\text{lcm\_a} = \text{LCM}(a_0, a_1, \dots, a_{n-1})$.
2. Tính $\text{gcd\_b} = \text{GCD}(b_0, b_1, \dots, b_{m-1})$.
3. Khởi tạo `count = 0`.
4. Duyệt biến `multiple` bắt đầu từ $\text{lcm\_a}$, mỗi bước cộng thêm $\text{lcm\_a}$ cho đến khi vượt quá $\text{gcd\_b}$:
   - Nếu $\text{gcd\_b} \pmod{\text{multiple}} == 0$, tăng `count` lên 1.
5. Trả về `count`.

### 3. Độ phức tạp
- **Thời gian (Time Complexity):** $O(n \log(\min(a)) + m \log(\min(b)) + \frac{\text{gcd\_b}}{\text{lcm\_a}})$ — tối ưu hơn rất nhiều so với vét cạn từng số từ $1$ đến $100$.
- **Bộ nhớ (Space Complexity):** $O(1)$ phụ trợ.

---

## 💻 Mã nguồn (Python 3)

```python
import math
import os
from functools import reduce

def lcm(x, y):
    """Tính Bội chung nhỏ nhất (LCM) của 2 số"""
    return (x * y) // math.gcd(x, y)

def getTotalX(a, b):
    # Tìm LCM của toàn bộ mảng a
    lcm_a = reduce(lcm, a)
    # Tìm GCD của toàn bộ mảng b
    gcd_b = reduce(math.gcd, b)
    
    count = 0
    multiple = lcm_a
    
    # Chỉ xét các bội số của lcm_a không vượt quá gcd_b
    while multiple <= gcd_b:
        if gcd_b % multiple == 0:
            count += 1
        multiple += lcm_a
        
    return count

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    first_multiple_input = input().rstrip().split()
    n = int(first_multiple_input[0])
    m = int(first_multiple_input[1])

    arr = list(map(int, input().rstrip().split()))
    brr = list(map(int, input().rstrip().split()))

    total = getTotalX(arr, brr)

    fptr.write(str(total) + '\n')
    fptr.close()
