// --- Day 11: Reactor ---
// https://adventofcode.com/2025/day/11

import 'dart:io';
import 'package:advent_of_code_2025/day11.dart';
import 'package:advent_of_code_2025/util.dart';
import 'package:test/test.dart';

final input = File('test/data/day11.txt').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
        solveA(
          r'''
aaa: you hhh
you: bbb ccc
bbb: ddd eee
ccc: ddd eee fff
ddd: ggg
eee: out
fff: out
ggg: out
hhh: ccc fff iii
iii: out
'''
              .asLines,
        ),
        equals(5),
      );
    });
    test('Solution', () {
      expect(solveA(input), equals(615));
    });
  });
}
