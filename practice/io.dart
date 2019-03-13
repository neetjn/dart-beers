import 'dart:io';

void main() async {
  // create new directory
  final dir = new Directory('test');
  assert(!dir.existsSync());
  dir.createSync();
  assert(dir.existsSync());
  print(dir.path);
  // create new file
  final file = new File('test/io.txt');
  assert(!file.existsSync());
  file.createSync();
  assert(file.existsSync());
  file.writeAsStringSync('Hello World');
  String v = file.readAsStringSync();
  print(v);
  await file.writeAsString(v + '\nHello John').then((file) {
    file.readAsString().then((contents) => print(contents));
  });
  // delete file
  file.deleteSync();
  assert(!file.existsSync());
  // delete directory
  dir.deleteSync();
  assert(!dir.existsSync());
}
