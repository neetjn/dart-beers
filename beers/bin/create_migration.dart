import 'dart:io';
import 'package:colorize/colorize.dart';

void main() {
  color('Generating database migration.', isBold: true, front: Styles.GREEN);
  Process.run('aqueduct', ['db', 'generate']).then((ProcessResult results) {
    print(results.stdout);
  });
}
