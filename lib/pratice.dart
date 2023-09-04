void main() {
  int k = 1, l = 1, m = 65;

  for (int i = 1; i <= 3; i++) {
    for (int j = 1; j <= i; j++) {
      k++;
      if (k % 2 == 0) {
        print("$m");
        m++;
        m++;
      } else {
        print("$l");
        l++;
        l++;
      }
    }
  }
}
