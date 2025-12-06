// --- Day 6: Trash Compactor ---
// https://adventofcode.com/2025/day/6

import 'package:collection/collection.dart';

final whiteSpaceRegExp = RegExp(r' +');

int solveA(Iterable<String> input) {
  final numbers = <List<int>>[];
  late final List<String> operators;

  for (final line in input) {
    final parts = line.trim().split(whiteSpaceRegExp);

    if (parts.first == '*' || parts.first == '+') {
      operators = parts;
    } else {
      numbers.add(parts.map(int.parse).toList(growable: false));
    }
  }

  final sums = numbers.first;

  for (final line in numbers.skip(1)) {
    for (var i = 0; i < line.length; i++) {
      if (operators[i] == '+') {
        sums[i] += line[i];
      } else {
        sums[i] *= line[i];
      }
    }
  }

  return sums.sum;
}

int solveB(List<String> input) {
  final numBuffer = <int>[];
  var result = 0;

  for (var i = input.first.length - 1; i >= 0; i--) {
    final row = input
        .take(input.length - 1)
        .map((line) => line[i])
        .join()
        .trim();

    if (row.isEmpty) {
      continue;
    }

    numBuffer.add(int.parse(row));

    // Check operator row
    if (input.last.length <= i) {
      continue;
    }

    switch (input.last[i]) {
      case '+':
        result += numBuffer.reduce((a, b) => a + b);
        numBuffer.clear();
      case '*':
        result += numBuffer.reduce((a, b) => a * b);
        numBuffer.clear();
    }
  }

  return result;
}
