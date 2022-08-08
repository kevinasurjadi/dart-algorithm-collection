import 'dart:math';

int binarySearch(List<int> list, int search) {
  int lowerBound = 0;
  int upperBound = list.length - 1;
  while (lowerBound <= upperBound) {
    int middle = (lowerBound + upperBound) ~/ 2;
    if (middle == search) {
      return middle;
    } else if (search < middle) {
      upperBound = middle - 1;
    } else {
      lowerBound = middle + 1;
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
  var result = binarySearch(list, input);
  print('\nOutput\n---');
  if (result > -1) {
    print('$input found in the $result index');
  } else {
    print('$input not found in the list');
  }
}