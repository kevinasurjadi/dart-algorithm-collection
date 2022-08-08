import 'dart:math';

int sequentialSearch(List<int> list, int search) {
  for (var index = 0; index < list.length; index++) {
    // If any element matches search return the index
    if (list.elementAt(index) == search) {
      return index;
    }
  }
  // If no element matches search
  return -1;
}

void main() {
  List<int> list = List.generate(100, (index) => Random().nextInt(100));
  int input = Random().nextInt(100);
  print('Input\n---');
  print('Searching $input in $list ...');
  var result = sequentialSearch(list, input);
  print('\nOutput\n---');
  if (result > -1) {
    print('$input found in the $result index');
  } else {
    print('$input not found in the list');
  }
}