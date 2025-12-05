// --- Day 5: Cafeteria ---
// https://adventofcode.com/2025/day/5

import 'package:collection/collection.dart';

int solveA(Iterable<String> input) {
  List<(int, int)> intervals = [];
  final inputIterator = input.iterator;

  // Parse intervals
  while (inputIterator.moveNext() && inputIterator.current != '') {
    final [from, to] = inputIterator.current.split('-');
    intervals.add((int.parse(from), int.parse(to)));
  }

  int count = 0;

  // Handle ids
  while (inputIterator.moveNext()) {
    final id = int.parse(inputIterator.current);

    if (intervals.any((interval) => interval.inRange(id))) {
      count++;
    }
  }

  return count;
}

int solveB(Iterable<String> input) {
  // Parse intervals. Set because there are duplicates
  Set<(int, int)> intervals = {
    for (final [from, to]
        in input.takeWhile((line) => line != '').map((line) => line.split('-')))
      (int.parse(from), int.parse(to)),
  };
  bool update;

  loop:
  do {
    update = false;

    for (final intervalA in intervals) {
      for (final intervalB in intervals) {
        if (intervalA == intervalB) continue;

        final fromInRange = intervalA.inRange(intervalB.$1);
        final toInRange = intervalA.inRange(intervalB.$2);

        // Skip since no overlap
        if (!fromInRange && !toInRange) {
          continue;
        }

        // Interval are fully inside another interval
        if (fromInRange && toInRange) {
          intervals.remove(intervalB);

          update = true;
          continue loop;
        }

        // Start is in range, move end
        if (fromInRange) {
          intervals.remove(intervalA);
          intervals.remove(intervalB);
          intervals.add((intervalA.$1, intervalB.$2));

          update = true;
          continue loop;
        }

        // End is in range, move start
        if (fromInRange) {
          intervals.remove(intervalA);
          intervals.remove(intervalB);
          intervals.add((intervalB.$1, intervalA.$2));

          update = true;
          continue loop;
        }
      }
    }
  } while (update == true);

  return intervals.map((interval) => interval.$2 - interval.$1 + 1).sum;
}

extension on (int, int) {
  bool inRange(int value) => value >= $1 && value <= $2;
}
