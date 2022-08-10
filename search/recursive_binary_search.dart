import 'dart:math';

int recursiveBinarySearch(List<int> list, int search, int lowerBound, int upperBound) {
  if (lowerBound > upperBound) {
    return -1;
  }
  var middle = (lowerBound + upperBound) ~/ 2;
  if (search == list.elementAt(middle)) {
    return middle;
  } else if (search > list.elementAt(middle)) {
    return recursiveBinarySearch(list, search, middle + 1, upperBound);
  } else {
    return recursiveBinarySearch(list, search, lowerBound, middle - 1);
  }
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
  var result = recursiveBinarySearch(list, input, 0, list.length - 1);
  print('\nOutput\n---');
  if (result > -1) {
    print('$input found in the $result index');
  } else {
    print('$input not found in the list');
  }
}