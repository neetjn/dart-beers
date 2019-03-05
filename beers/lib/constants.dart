library beers.constants;

import 'dart:io' show Platform;

String APP_HOST = Platform.environment['APP_HOST'];
String APP_PORT = Platform.environment['APP_PORT'];
String POSTGRES_HOST = Platform.environment['POSTGRES_HOST'];
String POSTGRES_PORT = Platform.environment['POSTGRES_PORT'];
String MOGO_HOST = Platform.environment['MOGO_HOST'];
String MOGO_PORT = Platform.environment['MOGO_PORT'];
