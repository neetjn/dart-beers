library beers.constants;

import 'package:beers/beers/utils.dart';

String APP_HOST = getEnv('APP_HOST', '0.0.0.0');
int APP_PORT = int.parse(getEnv('APP_PORT', '8080'));
String POSTGRES_HOST = getEnv('POSTGRES_HOST', 'localhost');
int POSTGRES_PORT = int.parse(getEnv('POSTGRES_PORT', '5432'));
String POSTGRES_USER = getEnv('POSTGRES_USER', 'postgres');
String POSTGRES_PASS = getEnv('POSTGRES_PASS', '');
String POSTGRES_DATABASE = getEnv('POSTGRES_DATABASE', 'beers');

class ServiceRelDef {
  static const String ROOT = 'root';
  static const String USERS = 'users';
  static const String BEERS = 'beers';
}

class ServiceRouteDef {
  static const String ROOT = '/';
  static const String USERS = '/user/[:id]';
  static const String BEERS = '/beer/[:id]';
}
