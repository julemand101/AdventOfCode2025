// --- Day 1: Secret Entrance ---
// https://adventofcode.com/2025/day/1

import 'dart:io';

int solveA(Iterable<String> input) {
  var pos = 50;
  var count = 0;

  for (final distance in input.map(parse)) {
    if ((pos = (pos + distance) % 100) == 0) {
      count++;
    }
  }

  return count;
}

int solveB(Iterable<String> input) {
  var pos = 50;
  var count = 0;

  for (final distance in input.map(parse)) {
    pos += distance;
    print('\tto point ${pos % 100}, passing zero: ${(pos / 100).floor().abs()} times');

    count += (pos / 100).floor().abs();
    pos = pos % 100;
  }

  // Too low: 5876
  return count;
}

int parse(String input) {
  print('The dial is rotated: $input');

  final value = int.parse(input.substring(1));
  return input.startsWith('L') ? -1 * value : value;
}

void main() {
  var pos = 50;
  pos += 1000;

  print(pos);
  print(pos % 100);
  print((pos / 100).floor().abs());
  print(pos ~/ 100);
  print(pos.remainder(100));
}
