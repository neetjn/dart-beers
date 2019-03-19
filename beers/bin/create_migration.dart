import 'dart:io';
import 'package:beers/constants.dart' as constants;

void main() {
  Process.run('aqueduct', ['db', 'generate']).then((ProcessResult results) {
    print(results.stdout);
  });
}
