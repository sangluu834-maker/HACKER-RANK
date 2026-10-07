# A Very Big Sum

- **Nền tảng:** [HackerRank](https://www.hackerrank.com/)
- **Chủ đề:** Algorithms > Warmup
- **Độ khó:** Easy
- **Ngôn ngữ:** C++

---

## 📌 Đề bài

Cho một mảng gồm $n$ số nguyên, nhiệm vụ của bạn là tính và in ra tổng của các phần tử trong mảng. Lưu ý rằng một số phần tử có giá trị rất lớn, có thể gây ra hiện tượng tràn số nguyên 32-bit.

### Mô tả hàm
Hàm `aVeryBigSum` nhận tham số:
- `ar`: Mảng chứa các số nguyên (`vector<long long>`)

**Giá trị trả về:**
- Tổng của các phần tử trong mảng (`long long`).

### Định dạng dữ liệu
- **Input:**
  - Dòng đầu tiên chứa số nguyên $n$ (số lượng phần tử của mảng).
  - Dòng thứ hai chứa $n$ số nguyên cách nhau bởi dấu cách.
- **Output:**
  - In ra giá trị tổng của các phần tử.

### Lưu ý quan trọng
- Giới hạn của kiểu số nguyên 32-bit có dấu (`int`) rơi vào khoảng $-2^{31}$ đến $2^{31} - 1$ (tương đương $\approx \pm 2 \times 10^9$).
- Khi cộng dồn các số nguyên lớn, tổng có thể vượt quá giới hạn trên. Cần sử dụng kiểu dữ liệu 64-bit (`long long` trong C/C++ hoặc `long` trong Java) để tránh lỗi tràn số (integer overflow).

---

## 💡 Ý tưởng giải thuật & Phân tích

1. **Phương pháp:**
   - Dùng biến `sum` kiểu `long long` khởi tạo bằng `0`.
   - Duyệt qua từng phần tử trong mảng và cộng dồn vào `sum`.
   - Truyền mảng dưới dạng tham chiếu hằng `const &` để tránh chi phí sao chép bộ nhớ (copy overhead).
2. **Độ phức tạp:**
   - **Thời gian (Time Complexity):** $O(n)$ do duyệt qua mảng đúng 1 lần.
   - **Bộ nhớ (Space Complexity):** $O(1)$ (không tốn thêm không gian lưu trữ phụ trợ).

---

## 💻 Mã nguồn (C++)

### Cách 1: Vòng lặp truyền thống
```cpp
#include <iostream>
#include <vector>

using namespace std;

// Dùng const vector<long long>& để tối ưu hiệu năng bộ nhớ
long long aVeryBigSum(const vector<long long>& ar) {
    long long sum = 0;
    for (size_t i = 0; i < ar.size(); i++) {
        sum += ar[i];
    }
    return sum;
}

int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);

    int n;
    if (cin >> n) {
        vector<long long> ar(n);
        for (int i = 0; i < n; i++) {
            cin >> ar[i];
        }
        cout << aVeryBigSum(ar) << "\n";
    }

    return 0;
}
