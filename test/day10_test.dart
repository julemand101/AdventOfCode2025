// --- Day 10: Factory ---
// https://adventofcode.com/2025/day/10

import 'dart:io';
import 'package:advent_of_code_2025/day10.dart';
import 'package:advent_of_code_2025/util.dart';
import 'package:test/test.dart';

final input = File('test/data/day10.txt').readAsLinesSync();

final example =
    r'''
[.##.] (3) (1,3) (2) (2,3) (0,2) (0,1) {3,5,4,7}
[...#.] (0,2,3,4) (2,3) (0,4) (0,1,2) (1,2,3,4) {7,5,12,7,2}
[.###.#] (0,1,2,3,4) (0,3,4) (0,1,2,4,5) (1,2) {10,11,11,5,10,5}
'''
        .asLines
        .toList(growable: true);

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(example), equals(7));
    });
    test('Solution', () {
      expect(solveA(input), equals(502));
    });
  });
}
