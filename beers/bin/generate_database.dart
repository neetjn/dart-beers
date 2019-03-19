import 'dart:io';
import 'package:colorize/colorize.dart';
import 'package:postgres/postgres.dart' as pg;
import 'package:beers/constants.dart' as constants;

Map logOpts = {
  'isBold': true,
  'front': Styles.GREEN
};

Map errorOpts = {
  'isBold': true,
  'front': Styles.RED
};

void main() async {
  // ensure target database exists
  pg.PostgreSQLConnection db = pg.PostgreSQLConnection(constants.POSTGRES_HOST,
                                   constants.POSTGRES_PORT,
                                   'postgres',
                                   username: constants.POSTGRES_USER);
  if (constants.POSTGRES_PASS.isNotEmpty) {
    db.password = constants.POSTGRES_PASS;
  }
  await db.open();
  color('Trying to create database "${constants.POSTGRES_DATABASE}".', isBold: true, front: Styles.GREEN);
  await db.query('CREATE DATABASE "${constants.POSTGRES_DATABASE}";').catchError((e) {
    color('Database "${constants.POSTGRES_DATABASE}" already exists.', isBold: true, front: Styles.RED);
  });
  db.close();

  // structure database and relations using aqueduct models and migrations
  String psqlUri = 'postgress://'
                   '${constants.POSTGRES_PASS.isEmpty ? constants.POSTGRES_USER : constants.POSTGRES_USER + ':' + constants.POSTGRES_PASS}'
                   '@${constants.POSTGRES_HOST}:${constants.POSTGRES_PORT}'
                   '/${constants.POSTGRES_DATABASE}';
  color('Running aqueduct upgrade.', isBold: true, front: Styles.GREEN);
  Process.run('aqueduct', ['db', 'upgrade', '--connect', psqlUri]).then((ProcessResult results) {
    print(results.stdout);
    exit(1);
  });
}
