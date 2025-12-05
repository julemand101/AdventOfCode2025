// --- Day 5: Cafeteria ---
// https://adventofcode.com/2025/day/5

import 'dart:math';

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

        // To and/or From in range. Do merge
        if (intervalA.inRange(intervalB.$1) ||
            intervalA.inRange(intervalB.$2)) {
          intervals
            ..remove(intervalA)
            ..remove(intervalB)
            ..add((
              min(intervalA.$1, intervalB.$1),
              max(intervalA.$2, intervalB.$2),
            ));

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
