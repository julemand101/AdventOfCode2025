// --- Day 4: Printing Department ---
// https://adventofcode.com/2025/day/4

import 'dart:typed_data';

final emptyChar = '.'.codeUnits.first;
final paperChar = '@'.codeUnits.first;

int solveA(Iterable<String> input) {
  Grid grid = Grid(input.first.length, input.length)
    ..setAllValues(input.expand((line) => line.codeUnits));
  var result = 0;

  for (var y = 0; y < grid.ySize; y++) {
    for (var x = 0; x < grid.xSize; x++) {
      if (grid.get(x, y) == paperChar && grid.paperAround(x, y) < 4) {
        result++;
      }
    }
  }

  return result;
}

int solveB(Iterable<String> input) {
  Grid grid = Grid(input.first.length, input.length)
    ..setAllValues(input.expand((line) => line.codeUnits));
  var result = 0;
  bool gridChanged;

  do {
    gridChanged = false;

    for (var y = 0; y < grid.ySize; y++) {
      for (var x = 0; x < grid.xSize; x++) {
        if (grid.get(x, y) == paperChar && grid.paperAround(x, y) < 4) {
          grid.setValue(x, y, emptyChar);
          gridChanged = true;
          result++;
        }
      }
    }
  } while (gridChanged);

  return result;
}

class Grid {
  final int xSize;
  final int ySize;
  final Uint8List list;

  Grid(this.xSize, this.ySize) : list = Uint8List(xSize * ySize);

  int get(int x, int y) {
    final pos = _listIndexOf(x, y);
    return (x >= 0 && x < xSize && y >= 0 && y < ySize) ? list[pos] : emptyChar;
  }

  int _listIndexOf(int x, int y) => x + (y * xSize);

  int setValue(int x, int y, int value) => list[_listIndexOf(x, y)] = value;
  void setAllValues(Iterable<int> values) => list.setAll(0, values);

  int paperAround(int x, int y) {
    var takenSpace = 0;

    if (get(x - 1, y - 1) == paperChar) takenSpace++;
    if (get(x - 0, y - 1) == paperChar) takenSpace++;
    if (get(x + 1, y - 1) == paperChar) takenSpace++;

    if (get(x - 1, y - 0) == paperChar) takenSpace++;
    if (get(x + 1, y - 0) == paperChar) takenSpace++;

    if (get(x - 1, y + 1) == paperChar) takenSpace++;
    if (get(x - 0, y + 1) == paperChar) takenSpace++;
    if (get(x + 1, y + 1) == paperChar) takenSpace++;

    return takenSpace;
  }

  @override
  String toString() {
    final buffer = StringBuffer();

    for (var y = 0; y < ySize; y++) {
      for (var x = 0; x < xSize; x++) {
        buffer.writeCharCode(get(x, y));
      }
      buffer.writeln();
    }

    return buffer.toString();
  }
}
