// --- Day 11: Reactor ---
// https://adventofcode.com/2025/day/11

import 'package:collection/collection.dart';

int solveA(Iterable<String> input) {
  final deviceMap = <String, List<String>>{
    for (final [device, ...connections] in input.map((l) => l.split(' ')))
      device.substring(0, device.length - 1): connections,
  };

  int visit(String node) =>
      (node == 'out') ? 1 : deviceMap[node]!.map(visit).sum;

  return visit('you');
}
