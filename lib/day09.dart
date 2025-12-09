// --- Day 9: Movie Theater ---
// https://adventofcode.com/2025/day/9

import 'dart:math';

int solveA(Iterable<String> input) {
  final points = [
    for (final [x, y] in input.map((line) => line.split(',')))
      (int.parse(x), int.parse(y)),
  ];
  var maxRectangleSize = 0;

  for (final (index, pointA) in points.indexed) {
    for (final pointB in points.skip(index + 1)) {
      maxRectangleSize = max(
        ((pointA.$1 - pointB.$1).abs() + 1) *
            ((pointA.$2 - pointB.$2).abs() + 1),
        maxRectangleSize,
      );
    }
  }

  return maxRectangleSize;
}

int solveB(Iterable<String> input) {
  final points = [
    for (final [x, y] in input.map((line) => line.split(',')))
      (int.parse(x), int.parse(y)),
  ];
  var maxRectangleSize = 0;

  for (final (index, pointA) in points.indexed) {
    for (final pointB in points.skip(index + 1)) {
      maxRectangleSize = max(
        ((pointA.$1 - pointB.$1).abs() + 1) *
            ((pointA.$2 - pointB.$2).abs() + 1),
        maxRectangleSize,
      );
    }
  }

  return maxRectangleSize;
}
