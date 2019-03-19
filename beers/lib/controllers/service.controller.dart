library beers.controllers.service;

import 'dart:core';
import 'dart:mirrors';

import 'package:aqueduct/aqueduct.dart';

import 'package:beers/constants.dart' as constants;
import 'package:beers/mediatypes/apiroot.dart';
import 'package:beers/controllers/base.controller.dart';

String constructUri({String route, String protocol: 'http'}) {
  return '${protocol}://${constants.APP_HOST}:${constants.APP_PORT}${route}';
}

@Resource(route: constants.ServiceRouteDef.ROOT, rel: constants.ServiceRelDef.ROOT)
class ServiceController extends BaseResourceController {
  List<Resource> resources;
  ApiRootDto apiroot;

  ServiceController(List<Resource> this.resources) {
    // TODO: replace with constructUri, serve on demand once routing resolved
    apiroot = new ApiRootDto(resources.map<LinkDto>((Resource resource) => LinkDto(resource.route, resource.rel)).toList());
  }

  @Operation.get()
  Future<Response> getBeerCollection() async {
    return Response.ok(apiroot.asMap());
  }
}
