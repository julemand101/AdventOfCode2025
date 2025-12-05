// --- Day 5: Cafeteria ---
// https://adventofcode.com/2025/day/5

import 'dart:io';
import 'package:advent_of_code_2025/day05.dart';
import 'package:advent_of_code_2025/util.dart';
import 'package:test/test.dart';

final input = File('test/data/day05.txt').readAsLinesSync();

final example =
    r'''
3-5
10-14
16-20
12-18

1
5
8
11
17
32
'''
        .asLines
        .toList(growable: false);

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(example), equals(3));
    });
    test('Solution', () {
      expect(solveA(input), equals(701));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(example), equals(14));
    });
    test('Solution', () {
      expect(solveB(input), equals(-1));
    });
  }, skip: true);
}
