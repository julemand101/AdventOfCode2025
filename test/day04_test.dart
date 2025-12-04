// --- Day 4: Printing Department ---
// https://adventofcode.com/2025/day/4

import 'dart:io';
import 'package:advent_of_code_2025/day04.dart';
import 'package:advent_of_code_2025/util.dart';
import 'package:test/test.dart';

final input = File('test/data/day04.txt').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
        solveA(
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
              .asLines,
        ),
        equals(13),
      );
    });
    test('Solution', () {
      expect(solveA(input), equals(-1));
    });
  }, skip: true);
}
