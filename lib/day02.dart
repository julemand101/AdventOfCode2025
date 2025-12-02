// --- Day 2: Gift Shop ---
// https://adventofcode.com/2025/day/2

int solveA(String input) => solve(input, (number) {
  if (number.length % 2 == 0) {
    final a = number.substring(0, number.length ~/ 2);
    final b = number.substring(number.length ~/ 2);

    if (a == b) {
      return true;
    }
  }

  return false;
});

int solveB(String input) => solve(input, (number) {
  final halfLength = number.length ~/ 2;

  for (var i = 1; i <= halfLength; i++) {
    final pattern = number.substring(0, i);
    final regExp = RegExp('^($pattern)+\$');

    if (regExp.hasMatch(number)) {
      return true;
    }
  }

  return false;
});

int solve(String input, bool Function(String number) check) {
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
