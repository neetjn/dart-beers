const int range = 1000;
const List<int> multiples = [3, 5];

bool isMultiple(int check) {
  return multiples.any((item) => check % item == 0);
}

void main() {
  // euler's problem: https://projecteuler.net/problem=1

  List<int> multiples = [];
  for (int i = 1; i < range + 1; i++) {
    if (isMultiple(i))
      multiples.add(i);
  }

  int sum = multiples.reduce((a, b) => a + b);
  print(sum);
}
