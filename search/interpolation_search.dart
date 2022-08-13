import 'dart:math';

int interpolationSearch(List<int> list, int search, int lowerBound, int upperBound) {
  int position;
  if (lowerBound <= upperBound && search >= list.elementAt(lowerBound) && search <= list.elementAt(upperBound)) {
    position = lowerBound + ((upperBound - lowerBound) / (list.elementAt(upperBound) - list.elementAt(lowerBound)) * (search - list.elementAt(lowerBound))).floor();

    if (list.elementAt(position) == search) {
      return position;
    } 
    if (list.elementAt(position) < search) {
      return interpolationSearch(list, search, position + 1, upperBound);
    } 
    if (list.elementAt(position) > search) {
      return interpolationSearch(list, search, lowerBound, position - 1);
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
  var result = interpolationSearch(list, input, 0, list.length - 1);
  print('\nOutput\n---');
  if (result > -1) {
    print('$input found in the $result index');
  } else {
    print('$input not found in the list');
  }
}