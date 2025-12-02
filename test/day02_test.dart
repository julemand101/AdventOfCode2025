// --- Day 2: Gift Shop ---
// https://adventofcode.com/2025/day/2

import 'dart:io';
import 'package:advent_of_code_2025/day02.dart';
import 'package:test/test.dart';

final input = File('test/data/day02.txt').readAsStringSync();

final example =
    '11-22,95-115,998-1012,1188511880-1188511890,222220-222224,'
    '1698522-1698528,446443-446449,38593856-38593862,565653-565659,'
    '824824821-824824827,2121212118-2121212124';

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(example), equals(1227775554));
    });
    test('Solution', () {
      expect(solveA(input), equals(19605500130));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(example), equals(4174379265));
    });
    test('Solution', () {
      expect(solveB(input), equals(-1));
    });
  }, skip: true);
}
