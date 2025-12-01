// --- Day 1: Secret Entrance ---
// https://adventofcode.com/2025/day/1

int solveA(Iterable<String> input) {
  var pos = 50;
  var count = 0;

  for (final distance in input.map(parse)) {
    if ((pos = (pos + distance) % 100) == 0) {
      count++;
    }
  }

  return count;
}

int solveB(Iterable<String> input) {
  var pos = 50;
  var count = 0;

  for (final distance in input.map(parse)) {
    final temp = pos + distance;

    count += temp.abs() ~/ 100 + ((pos != 0 && temp <= 0) ? 1 : 0);
    pos = temp % 100;
  }

  return count;
}

int parse(String input) {
  final value = int.parse(input.substring(1));
  return input.startsWith('L') ? -1 * value : value;
}
