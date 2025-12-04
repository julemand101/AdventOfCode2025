// --- Day 4: Printing Department ---
// https://adventofcode.com/2025/day/4

import 'dart:io';
import 'package:advent_of_code_2025/day04.dart';
import 'package:advent_of_code_2025/util.dart';
import 'package:test/test.dart';

final input = File('test/data/day04.txt').readAsLinesSync();

final example =
    r'''
..@@.@@@@.
@@@.@.@.@@
@@@@@.@.@@
@.@@@@..@.
@@.@@@@.@@
.@@@@@@@.@
.@.@.@.@@@
@.@@@.@@@@
.@@@@@@@@.
@.@.@@@.@.
'''
        .asLines
        .toList(growable: false);

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(example), equals(13));
    });
    test('Solution', () {
      expect(solveA(input), equals(1437));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(example), equals(43));
    });
    test('Solution', () {
      expect(solveB(input), equals(8765));
    });
  });
}
