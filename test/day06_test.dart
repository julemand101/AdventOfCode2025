// --- Day 6: Trash Compactor ---
// https://adventofcode.com/2025/day/6

import 'dart:io';
import 'package:advent_of_code_2025/day06.dart';
import 'package:advent_of_code_2025/util.dart';
import 'package:test/test.dart';

final input = File('test/data/day06.txt').readAsLinesSync();

final example =
    r'''
123 328  51 64 
 45 64  387 23 
  6 98  215 314
*   +   *   +  
'''
        .asLines
        .toList(growable: false);

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(example), equals(4277556));
    });
    test('Solution', () {
      expect(solveA(input), equals(5552221122013));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(example), equals(3263827));
    });
    test('Solution', () {
      expect(solveB(input), equals(11371597126232));
    });
  });
}
