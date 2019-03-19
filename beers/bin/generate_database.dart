import 'dart:io';
import 'package:beers/constants.dart' as constants;

void main() {
  String psqlUri = 'postgress://${constants.POSTGRES_USER}@${constants.POSTGRES_HOST}:${constants.POSTGRES_PORT}/${constants.POSTGRES_DATABASE}';
  if (constants.POSTGRES_PASS.isNotEmpty) {
    psqlUri = psqlUri.replaceAll(constants.POSTGRES_USER, '${constants.POSTGRES_USER}:${constants.POSTGRES_PASS}');
  }
  Process.run('aqueduct', ['db', 'upgrade', '--connect', psqlUri]).then((ProcessResult results) {
    print(results.stdout);
  });
}
