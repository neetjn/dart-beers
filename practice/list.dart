void main() {
  const range = 5;
  // generate a list using an iterable generator
  List<dynamic> numbers = Iterable.generate(range).toList();
  // create an empty iterable
  var empty = Iterable.empty();
  // create an empty list using an empty iterable
  List<dynamic> _empty = empty.toList();

  // list of strings
  List<String> dictionary = ['Foo', 'Bar', 'lol'];
  // generate a list of a diffrent type from map
  List<int> index = dictionary.map<int>((item) => dictionary.indexOf(item)).toList();
  // loop through list using list's forEach method
  index.forEach((item) => print(item));
  // loop through list using a for loop
  for(int i = 0; i < index.length; i++) {
    print(index[i]);
  }
  // append item to list
  index.add(index.length + 1);
  // insert item into list
  index.insert(0, -1);
  // reduce list
  // also see reduce, reduceLeft, and reduceRight
  int sum = index.reduce((a, b) => a + b);
  // create iterable for items in list based on condition
  index.where((item) => item >= 0);
  // find a single item in list
  index.singleWhere((item) => item == 0);
}
