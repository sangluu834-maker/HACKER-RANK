# Cut the Sticks

You are given a number of sticks of varying lengths. You will iteratively cut the sticks into smaller sticks, discarding the shortest pieces until there are none left. At each iteration you will determine the length of the shortest stick remaining, cut that length from each of the longer sticks and then discard all the pieces of that shortest length. When all the remaining sticks are the same length, they cannot be shortened so discard them.

Given the lengths of $n$ sticks, return the number of sticks that are left before each iteration until there are none left.

---

### Example
- $\text{arr} = [1, 2, 3]$

1. The shortest stick length is $1$. Number of sticks cut: $3$. After cutting $1$ from each stick and discarding the pieces of length $0$: $\text{remaining} = [1, 2]$.
2. The shortest stick length is $1$. Number of sticks cut: $2$. After cutting $1$ from each stick: $\text{remaining} = [1]$.
3. Only $1$ stick left of length $1$. Number of sticks cut: $1$. Discard it.

The returned array is `[3, 2, 1]`.

---

### Function Description
Complete the `cutTheSticks` function below.

`cutTheSticks` has the following parameter(s):
- `int arr[n]`: the lengths of each stick

**Returns:**
- `int[]`: the number of sticks before each cut operation is performed.

---

### Input Format
- The first line contains a single integer $n$, the size of $\text{arr}$.
- The next line contains $n$ space-separated integers, each representing the length of a stick.

### Constraints
- $1 \le n \le 1000$
- $1 \le \text{arr}[i] \le 1000$

---

### Sample Test Cases

#### Sample Input 0
```text
6
5 4 4 2 2 8
```

#### Sample Output 0
```text
6
4
2
1
```

**Explanation:**
- Iteration 1: Cut $2$, remaining sticks count = $6$
- Iteration 2: Cut $2$, remaining sticks count = $4$
- Iteration 3: Cut $1$, remaining sticks count = $2$
-
