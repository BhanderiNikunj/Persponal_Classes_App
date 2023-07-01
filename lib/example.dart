void main() {
  for (int i = 1; i <= 5; i++) {
    if (i % 2 == 0) {
      for (int j = 5; j >= i; j--) {
        if(j%2==0){
          print("1");
        }
        else{
          print("0");
        }
      }
    }
    else{
      for (int j = 5; j >= i; j--) {
        if(j%2==0){
          print("1");
        }
        else{
          print("0");
        }
      }
    }

    print("\n");
  }
}
