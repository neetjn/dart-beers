library beers.utils;

import 'dart:io';

String getEnv(String key, [String _default=null]) {
  String found = Platform.environment[key];
  return found != null ? found : _default;
}
