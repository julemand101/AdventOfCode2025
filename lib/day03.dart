// --- Day 3: Lobby ---
// https://adventofcode.com/2025/day/3

int solveA(Iterable<String> input) {
  var sum = 0;

  for (final line in input.map((line) => [...line.split('').map(int.parse)])) {
    var max1 = 0;
    var maxPos = -1;

    for (var i = 0; i < line.length - 1; i++) {
      final currentValue = line[i];

      if (currentValue > max1) {
        max1 = currentValue;
        maxPos = i;
      }
    }

    var max2 = 0;
    for (var i = maxPos + 1; i < line.length; i++) {
      final currentValue = line[i];

      if (currentValue > max2) {
        max2 = currentValue;
      }
    }

    sum += int.parse('$max1$max2');
  }

  return sum;
}
