# Taum and B'day

Taum is planning to celebrate the birthday of his friend, Diksha. There are two types of gifts that Diksha wants from Taum: one is black and the other is white. To make her happy, Taum has to buy $b$ black gifts and $w$ white gifts.
- The cost of each black gift is $bc$ units.
- The cost of every white gift is $wc$ units.
- The cost to convert a black gift into white gift or vice versa is $z$ units.

Determine the minimum cost of Diksha's gifts.

---

### Example
- $b = 3, w = 5$
- $bc = 3, wc = 4, z = 1$

He can buy a black gift for $3$ and convert it to a white gift for $1$, making the total cost of each white gift $4$. That matches the cost of a white gift, so he can do that or just buy $3$ black gifts and $5$ white gifts. Either way, the overall cost is $3 \times 3 + 5 \times 4 = 29$.

---

### Function Description
Complete the function `taumBday` in the editor below. It should return the minimal cost of obtaining the desired gifts.

`taumBday` has the following parameter(s):
- `int b`: the number of black gifts
- `int w`: the number of white gifts
- `int bc`: the cost of a black gift
- `int wc`: the cost of a white gift
- `int z`: the cost to convert one color gift to the other color

**Returns:**
- `int`: the minimum cost to purchase the gifts.

---

### Input Format
- The first line will contain an integer $t$, the number of test cases.
- The next $t$ pairs of lines are as follows:
  - The first line contains the values of integers $b$ and $w$.
  - The next line contains the values of integers $bc$, $wc$, and $z$.

### Constraints
- $1 \le t \le 10$
- $0 \le b, w, bc, wc, z \le 10^9$

---

### Sample Test Cases

#### Sample Input
```text
5
10 10
1 1 1
5 9
2 3 4
3 6
9 1 1
7 7
4 2 1
3 3
1 9 2
```

#### Sample Output
```text
20
37
12
35
12
```

**Explanation:**
- **Test Case #01:** $10 \times 1 + 10 \times 1 = 20$
- **Test Case #02:** $5 \times 2 + 9 \times 3 = 10 + 27 = 37$
- **Test Case #03:** Buy $9$ white gifts at $1$ each, convert $3$ to black at $1$ each $\implies 9 \times 1 + 3 \times 1 = 12$
- **Test Case #04:** Buy $14$ white gifts at $2$ each, convert $7$ to black at $1$ each $\implies 7 \times (2 + 1) + 7 \times 2 = 35$
- **Test Case #05:** Buy $6$ black gifts at $1$ each, convert $3$ to white at $2$ each $\implies 3 \times 1 + 3 \times (1 + 2) = 12$

---

### Python 3 Solution

> **Ý tưởng:**
> - Với mỗi món quà màu đen, ta có 2 cách để sở hữu: mua trực tiếp với giá $bc$, hoặc mua quà trắng rồi sơn lại với giá $wc + z$. Do đó giá rẻ nhất thực tế cho 1 món quà đen là:
>   $$\text{effective\_bc} = \min(bc, wc + z)$$
> - Tương tự, giá rẻ nhất thực tế cho 1 món quà trắng là:
>   $$\text{effective\_wc} = \min(wc, bc + z)$$
> - Tổng chi phí tối thiểu là:
>   $$\text{Total Cost} = b \times \text{effective\_bc} + w \times \text{effective\_wc}$$
> - Độ phức tạp thời gian: $O(1)$ cho mỗi test case.

```python
import os
import sys

def taumBday(b, w, bc, wc, z):
    # Tìm chi phí thấp nhất thực tế cho từng loại quà (mua trực tiếp hoặc mua loại kia rồi chuyển màu)
    effective_bc = min(bc, wc + z)
    effective_wc = min(wc, bc + z)
    
    return (b * effective_bc) + (w * effective_wc)

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    t = int(input().strip())

    for t_itr in range(t):
        first_multiple_input = input().rstrip().split()

        b = int(first_multiple_input[0])
        w = int(first_multiple_input[1])

        second_multiple_input = input().rstrip().split()

        bc = int(second_multiple_input[0])
        wc = int(second_multiple_input[1])
        z = int(second_multiple_input[2])

        result = taumBday(b, w, bc, wc, z)

        fptr.write(str(result) + '\n')

    fptr.close()
```
