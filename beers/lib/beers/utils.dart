library beers.utils;

import 'dart:io';

import 'package:aqueduct/aqueduct.dart';
import 'package:beers/constants.dart' as constants;
import 'package:beers/controllers/base.controller.dart';

String getEnv(String key, [String _default=null]) {
  String found = Platform.environment[key];
  return found != null ? found : _default;
}

String protocolFromRequest(Request request) {
  return request.raw.requestedUri.toString().split('://')[0];
}

String constructUri(String route, {String protocol: 'http'}) {
  return '${protocol}://${constants.APP_HOST}:${constants.APP_PORT}${route}';
}

String constructUriFromController(BaseResourceController controller, [Map args]) {
  // return '${protocol}://${constants.APP_HOST}:${constants.APP_PORT}${route}';
  return '';
}
