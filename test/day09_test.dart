// --- Day 9: Movie Theater ---
// https://adventofcode.com/2025/day/9

import 'dart:io';
import 'package:advent_of_code_2025/day09.dart';
import 'package:advent_of_code_2025/util.dart';
import 'package:test/test.dart';

final input = File('test/data/day09.txt').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
        solveA(
          r'''
7,1
11,1
11,7
9,7
9,5
2,5
2,3
7,3
'''
              .asLines,
        ),
        equals(50),
      );
    });
    test('Solution', () {
      expect(solveA(input), equals(4749838800));
    });
  });
}
