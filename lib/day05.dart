// --- Day 5: Cafeteria ---
// https://adventofcode.com/2025/day/5

int solveA(Iterable<String> input) {
  List<(int, int)> intervals = [];
  final inputIterator = input.iterator;

  // Parse intervals
  while (inputIterator.moveNext() && inputIterator.current != '') {
    final [from, to] = inputIterator.current.split('-');
    intervals.add((int.parse(from), int.parse(to)));
  }

  int count = 0;

  while (inputIterator.moveNext()) {
    final id = int.parse(inputIterator.current);

    if (intervals.any((interval) => id >= interval.$1 && id <= interval.$2)) {
      count++;
    }
  }

  return count;
}

int solveB(Iterable<String> input) {
  return 0;
}
