// --- Day 8: Playground ---
// https://adventofcode.com/2025/day/8

import 'dart:math';

class Point {
  final int x, y, z;
  Set<Point>? circuit;

  Point(this.x, this.y, this.z);

  double distanceTo(Point other) => sqrt(
    pow((x - other.x), 2) + pow((y - other.y), 2) + pow((z - other.z), 2),
  );

  @override
  int get hashCode => Object.hash(x, y, z);

  @override
  bool operator ==(Object other) =>
      other is Point && x == other.x && y == other.y && z == other.z;
}

int solveA(Iterable<String> input) {
  final points = <Point>[
    for (final [x, y, z] in input.map((line) => line.split(',')))
      Point(int.parse(x), int.parse(y), int.parse(z)),
  ];
  final circuits = <Set<Point>>[];

  late Point pointA;
  late Point pointB;
  var distance = 1000000000000000000.0;

  for (final point in points) {
    final lowDistancePoint = points
        .where((p) => !identical(p, point))
        .reduce((a, b) => a.distanceTo(point) < b.distanceTo(point) ? a : b);

    if (point.distanceTo(lowDistancePoint) < distance) {
      distance = point.distanceTo(lowDistancePoint);
      pointA = point;
      pointB = lowDistancePoint;
    }
  }

  print(pointA);
  print(pointB);
  print(distance);

  return 0;
}
