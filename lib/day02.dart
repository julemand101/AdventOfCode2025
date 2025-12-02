// --- Day 2: Gift Shop ---
// https://adventofcode.com/2025/day/2

int solveA(String input) {
  var sum = 0;

  for (final [a, b] in input.split(',').map((e) => e.split('-'))) {
    final from = int.parse(a);
    final to = int.parse(b);

    for (var i = from; i <= to; i++) {
      if (check(i.toString())) {
        sum += i;
      }
    }
  }

  return sum;
}

int solveB(String input) {
  return 0;
}

bool check(String number) {
  if (number.length % 2 == 0) {
    final a = number.substring(0, number.length ~/ 2);
    final b = number.substring(number.length ~/ 2);

    if (a == b) {
      return true;
    }
  }

  return false;
}
