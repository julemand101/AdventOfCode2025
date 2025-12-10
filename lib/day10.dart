// --- Day 10: Factory ---
// https://adventofcode.com/2025/day/10

import 'dart:collection';

final squareBracketPattern = RegExp(r'\[(.*)\]');
final parenthesesPattern = RegExp(r'\((.*?)\)');
final curlyBracesPattern = RegExp(r'\{(.*)\}');

Iterable<(List<bool>, List<List<int>>, List<int>)> parse(
  Iterable<String> input,
) sync* {
  for (final line in input) {
    final targetLightConfiguration = [
      for (final char in squareBracketPattern.firstMatch(line)![1]!.split(''))
        char == '#',
    ];

    final wiringSchematics = [
      for (final match in parenthesesPattern.allMatches(line))
        [...match[1]!.split(',').map(int.parse)],
    ];

    final joltageRequirements = [
      for (final value in curlyBracesPattern.firstMatch(line)![1]!.split(','))
        int.parse(value),
    ];

    yield (targetLightConfiguration, wiringSchematics, joltageRequirements);
  }
}

int solveA(Iterable<String> input) {
  var sum = 0;

  for (final (targetLightConfiguration, wiringSchematics, _) in parse(input)) {
    // Set over configurations we have already visited and can be skipped
    final cacheSet = HashSet<List<bool>>(
      equals: compareBoolLists,
      hashCode: (e) => Object.hashAll(e),
    );

    var count = 0;
    var configurations = [
      List.filled(targetLightConfiguration.length, false, growable: false),
    ];
    cacheSet.addAll(configurations);

    outerLoop:
    while (true) {
      final newConfigurations = <List<bool>>[];

      for (final configuration in configurations) {
        if (compareBoolLists(configuration, targetLightConfiguration)) {
          break outerLoop;
        }

        for (final wiringSchematic in wiringSchematics) {
          final newConfiguration = configuration.toList(growable: false);

          for (final value in wiringSchematic) {
            newConfiguration[value] = !newConfiguration[value];
          }

          // Only consider new configuration if never seen before
          if (cacheSet.add(newConfiguration)) {
            newConfigurations.add(newConfiguration);
          }
        }
      }

      count++;
      configurations = newConfigurations;
    }

    sum += count;
  }

  return sum;
}

bool compareBoolLists(List<bool> a, List<bool> b) {
  if (a.length != b.length) throw "Should not happen! $a | $b";

  for (var i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }

  return true;
}
