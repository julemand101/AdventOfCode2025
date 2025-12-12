// --- Day 12: Christmas Tree Farm ---
// https://adventofcode.com/2025/day/12

import 'dart:io';
import 'package:advent_of_code_2025/day12.dart';
import 'package:advent_of_code_2025/util.dart';
import 'package:test/test.dart';

final input = File('test/data/day12.txt').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
        solveA(
          r'''
0:
###
##.
##.

1:
###
##.
.##

2:
.##
###
##.

3:
##.
###
##.

4:
###
#..
###

5:
###
.#.
###

4x4: 0 0 0 0 2 0
12x5: 1 0 1 0 2 2
12x5: 1 0 1 0 3 2
'''
              .asLines,
        ),
        equals(2),
      );
    });
    test('Solution', () {
      expect(solveA(input), equals(-1));
    });
  }, skip: true);
}
