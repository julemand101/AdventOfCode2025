// --- Day 3: Lobby ---
// https://adventofcode.com/2025/day/3

import 'dart:io';
import 'package:advent_of_code_2025/day03.dart';
import 'package:advent_of_code_2025/util.dart';
import 'package:test/test.dart';

final input = File('test/data/day03.txt').readAsLinesSync();

final example =
    r'''
987654321111111
811111111111119
234234234234278
818181911112111
'''
        .asLines
        .toList(growable: false);

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(example), equals(357));
    });
    test('Solution', () {
      expect(solveA(input), equals(16927));
    });
  });
}
