import 'dart:io';

void main() async {
  final file = new File('io.txt');
  file.writeAsStringSync('Hello World');
  String v = file.readAsStringSync();
  print(v);
  await file.writeAsString(v + '\nHello John').then((file) {
    file.readAsString().then((contents) => print(contents));
  });
  file.deleteSync();
  assert(!file.existsSync());
}
