// --- Day 8: Playground ---
// https://adventofcode.com/2025/day/8

import 'dart:math';

class Point {
  final int x, y, z;
  List<Point> circuit = [];

  Point(this.x, this.y, this.z) {
    circuit.add(this);
  }

  double distanceTo(Point other) => sqrt(
    pow((x - other.x), 2) + pow((y - other.y), 2) + pow((z - other.z), 2),
  );
}

(List<Point>, List<(Point, Point, {double distance})>, List<List<Point>>) parse(
  Iterable<String> input,
) {
  final points = [
    for (final [x, y, z] in input.map((line) => line.split(',')))
      Point(int.parse(x), int.parse(y), int.parse(z)),
  ];

  final distances = [
    for (final (index, pointA) in points.take(points.length - 1).indexed)
      for (final pointB in points.skip(index + 1))
        (pointA, pointB, distance: pointA.distanceTo(pointB)),
  ]..sort((a, b) => a.distance.compareTo(b.distance));

  final circuits = <List<Point>>[for (final point in points) point.circuit];

  return (points, distances, circuits);
}

int solveA(Iterable<String> input, {int limit = 1000}) {
  final (points, distances, circuits) = parse(input);

  for (final (pointA, pointB, distance: _) in distances.take(limit)) {
    if (!identical(pointA.circuit, pointB.circuit)) {
      circuits.remove(pointB.circuit);

      for (final point in pointB.circuit) {
        pointA.circuit.add(point);
        point.circuit = pointA.circuit;
      }
    }
  }

  return (circuits..sort((a, b) => b.length.compareTo(a.length)))
      .take(3)
      .map((e) => e.length)
      .reduce((a, b) => a * b);
}

int solveB(Iterable<String> input) {
  final (points, distances, circuits) = parse(input);

  for (final (pointA, pointB, distance: _) in distances) {
    if (!identical(pointA.circuit, pointB.circuit)) {
      circuits.remove(pointB.circuit);

      for (final point in pointB.circuit) {
        pointA.circuit.add(point);
        point.circuit = pointA.circuit;
      }
    }

    if (circuits.length == 1) {
      return pointA.x * pointB.x;
    }
  }

  throw 'Did not find an answer!';
}
