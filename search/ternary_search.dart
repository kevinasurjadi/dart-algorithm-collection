import 'dart:math';

int recursiveTernarySearch(List<int> list, int search, int lowerBound, int upperBound) {
  if (lowerBound < upperBound) {
    int middle1 = lowerBound + (upperBound - lowerBound) ~/ 3;
    int middle2 = upperBound - (upperBound - lowerBound) ~/ 3;

    if (list.elementAt(middle1) == search) {
      return middle1;
    }
    if (list.elementAt(middle2) == search) {
      return middle2;
    }

    if (search < list.elementAt(middle1)) {
      return recursiveTernarySearch(list, search, lowerBound, middle1 - 1);
    } else if (search > list.elementAt(middle2)) {
      return recursiveTernarySearch(list, search, middle2 + 1, upperBound);
    } else {
      return recursiveTernarySearch(list, search, middle1 + 1, middle2 - 1);
    }
  }
  return -1;
}

void main() {
  List<int> list = List.generate(100, (index) => Random().nextInt(100));
  int input = Random().nextInt(100);
  print('Input\n---');
  print('Searching $input in $list ...');
  print('\n---');
  print('WARNING: LIST MUST BE SORTED');
  print('---');
  list.sort();
  print('Sorted list: $list');
  var result = recursiveTernarySearch(list, input, 0, list.length - 1);
  print('\nOutput\n---');
  if (result > -1) {
    print('$input found in the $result index');
  } else {
    print('$input not found in the list');
  }
}