import 'dart:math';

int jumpSearch(List<int> list, int search) {
  int step = sqrt(list.length).floor();
  int prev = 0;
  while (list.elementAt(min(step, list.length) - 1) < search) {
    prev = step;
    step += sqrt(list.length).floor();
    if (prev >= list.length) {
      return -1;
    }
  }
  for (int index = prev; index < min(step, list.length); index++) {
    if (list.elementAt(index) == search) {
      return index;
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
  var result = jumpSearch(list, input);
  print('\nOutput\n---');
  if (result > -1) {
    print('$input found in the $result index');
  } else {
    print('$input not found in the list');
  }
}