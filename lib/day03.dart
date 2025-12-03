// --- Day 3: Lobby ---
// https://adventofcode.com/2025/day/3

int solveA(Iterable<String> input) => solve(input, digits: 2);

int solveB(Iterable<String> input) => solve(input, digits: 12);

int solve(Iterable<String> input, {required int digits}) {
  var sum = 0;

  for (final line in input.map((line) => [...line.split('').map(int.parse)])) {
    final digitsBuffer = StringBuffer();
    var maxPos = -1;

    // spaceLeft = Amount of digits needed to be available for next iteration
    for (var spaceLeft = digits - 1; spaceLeft >= 0; spaceLeft--) {
      var max = 0;

      for (var i = maxPos + 1; i < line.length - spaceLeft; i++) {
        final currentValue = line[i];

        if (currentValue > max) {
          max = currentValue;
          maxPos = i;
        }
      }

      digitsBuffer.write(max);
    }

    sum += int.parse(digitsBuffer.toString());
  }

  return sum;
}
