// --- Day 7: Laboratories ---
// https://adventofcode.com/2025/day/7

import 'dart:collection';

typedef Point = (int, int);

extension on Point {
  Point get down => ($1, $2 + 1);

  Point get left => ($1 - 1, $2);

  Point get right => ($1 + 1, $2);
}

(Point, HashSet<Point>) parse(List<String> input) {
  late final Point startPoint;
  final splitters = HashSet<Point>();

  for (final (y, line) in input.indexed) {
    for (var x = 0; x < line.length; x++) {
      switch (line[x]) {
        case 'S':
          startPoint = (x, y);
        case '^':
          splitters.add((x, y));
      }
    }
  }

  return (startPoint, splitters);
}

int solveA(List<String> input) {
  final (startPoint, splitters) = parse(input);

  var splits = 0;
  var beams = {startPoint.down};

  for (var i = 1; i < input.length - 1; i++) {
    final newBeams = HashSet<Point>();

    for (final beam in beams) {
      final down = beam.down;

      if (splitters.contains(down)) {
        splits++;
        newBeams.add(down.left);
        newBeams.add(down.right);
      } else {
        newBeams.add(down);
      }
    }

    beams = newBeams;
  }

  return splits;
}

int solveB(List<String> input) {
  final (startPoint, splitters) = parse(input);
  Map<Point, int> cache = HashMap();

  int beam(int splits, Point pos) {
    final down = pos.down;
    if (down.$2 >= input.length) return splits;

    if (splitters.contains(down)) {
      final left = down.left;
      final right = down.right;

      return cache.putIfAbsent(left, () => beam(1, left)) +
          cache.putIfAbsent(right, () => beam(1, right));
    } else {
      return beam(splits, down);
    }
  }

  return beam(1, startPoint);
}
