# Jumping on the Clouds: Revisited

A child is playing a cloud hopping game. In this game, there are sequentially numbered clouds that can be thunderheads or cumulus clouds. The character must jump from cloud to cloud until it reaches the start again.

There is an array of clouds, $c$, and an initial energy level $e = 100$. The character starts from cloud $0$ and uses $1$ unit of energy to make a jump of size $k$ to cloud $(i + k) \pmod n$. If it lands on a thundercloud ($c[(i + k) \pmod n] = 1$), its energy ($e$) decreases by $2$ additional units. The game ends when the character lands back on cloud $0$.

Given the values of $n$, $k$, and the configuration of the clouds as an array $c$, determine the final value of $e$ after the game ends.

---

### Example
- $c = [0, 0, 1, 0]$
- $k = 2$

Path:
1. $0 \rightarrow 2$: energy reduces by $1$ (jump) $+ 2$ ($c[2] = 1$ is thundercloud) $= 97$.
2. $2 \rightarrow 0$: energy reduces by $1$ (jump) $+ 0$ ($c[0] = 0$) $= 96$.

Final energy level: `96`.

---

### Function Description
Complete the `jumpingOnClouds` function below.

`jumpingOnClouds` has the following parameter(s):
- `int c[n]`: the cloud types along the path
- `int k`: the length of one jump

**Returns:**
- `int`: the energy level remaining.

---

### Input Format
- The first line contains two space-separated integers, $n$ and $k$, the number of clouds and the jump distance.
- The second line contains $n$ space-separated integers $c[i]$ where $0 \le i < n$:
  - $c[i] = 0$: cumulus cloud.
  - $c[i] = 1$: thundercloud.

### Constraints
- $2 \le n \le 25$
- $1 \le k \le n$
- $n \pmod k = 0$
- $c[i] \in \{0, 1\}$

---

### Sample Test Cases

#### Sample Input
```text
8 2
0 0 1 0 0 1 1 0
```

#### Sample Output
```text
92
```

**Explanation:**
The sequence of jumps starting at cloud $0$:
1. $0 \rightarrow 2$: $e = 100 - 1 - 2 \times c[2] = 100 - 1 - 2(1) = 97$
