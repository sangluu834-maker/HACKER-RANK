# Cats and a Mouse

Two cats and a mouse are at various positions on a line. You will be given their starting positions. Your task is to determine which cat will reach the mouse first, assuming the mouse does not move and the cats travel at equal speed. If the cats arrive at the same time, the mouse will be allowed to move and it will escape while they fight.

You are given $q$ queries in the form of $x$, $y$, and $z$ representing the respective positions for Cat A, Cat B, and Mouse C. Complete the function `catAndMouse` to return the appropriate answer to each query:
- If Cat A catches the mouse first, return `Cat A`.
- If Cat B catches the mouse first, return `Cat B`.
- If both cats reach the mouse at the same time, return `Mouse C` as the two cats fight and the mouse escapes.

---

### Example
- $x = 2$ (Cat A)
- $y = 5$ (Cat B)
- $z = 4$ (Mouse C)

Distance from Cat A to Mouse: $\vert{}2 - 4\vert{} = 2$  
Distance from Cat B to Mouse: $\vert{}5 - 4\vert{} = 1$  
Cat B arrives first since it is closer. Return `'Cat B'`.

---

### Function Description
Complete the `catAndMouse` function below.

`catAndMouse` has the following parameter(s):
- `int x`: Cat A's position
- `int y`: Cat B's position
- `int z`: Mouse C's position

**Returns:**
- `string`: Either `'Cat A'`, `'Cat B'`, or `'Mouse C'`

---

### Input Format
- The first line contains a single integer, $q$, denoting the number of queries.
- Each of the $q$ subsequent lines contains three space-separated integers describing the respective values of $x$ (Cat A), $y$ (Cat B), and $z$ (Mouse C).

### Constraints
- $1 \le q \le 100$
- $1 \le x, y, z \le 100$

---

### Sample Test Cases

#### Sample Input 0
```text
2
1 2 3
1 3 2
```

#### Sample Output 0
```text
Cat B
Mouse C
```

**Explanation 0:**
- **Query 0:** Distance from Cat A ($1$) to Mouse ($3$) is $\vert{}1 - 3\vert{} = 2$. Distance from Cat B ($2$) to Mouse ($3$) is $\vert{}2 - 3\vert{} = 1$. Cat B arrives first $\rightarrow$ `Cat B`.
- **Query 1:** Cat A is at $1$, Cat B is at $3$, Mouse is at $2$. Both distances are $\vert{}1 - 2\vert{} = 1$ and $\vert{}3 - 2\vert{} = 1$. They arrive simultaneously $\rightarrow$ `Mouse C`.

---

### Python 3 Solution

```python
import os
import sys

# Complete the catAndMouse function below.
def catAndMouse(x, y, z):
    dist_a = abs(x - z)
    dist_b = abs(y - z)
    
    if dist_a < dist_b:
        return "Cat A"
    elif dist_b < dist_a:
        return "Cat B"
    else:
        return "Mouse C"

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    q = int(input())

    for q_itr in range(q):
        xyz = input().split()
        x = int(xyz[0])
        y = int(xyz[1])
        z = int(xyz[2])

        result = catAndMouse(x, y, z)
        fptr.write(result + '\n')

    fptr.close()
```
