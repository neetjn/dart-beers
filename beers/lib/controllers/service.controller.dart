library beers.controllers.service;

import 'dart:core';

import 'package:aqueduct/aqueduct.dart';

import 'package:beers/constants.dart' as constants;
import 'package:beers/mediatypes/apiroot.dart';
import 'package:beers/controllers/base.controller.dart';

String constructUri(String route, {String protocol: 'http'}) {
  return '${protocol}://${constants.APP_HOST}:${constants.APP_PORT}${route}';
}

@Resource(route: constants.ServiceRouteDef.ROOT, rel: constants.ServiceRelDef.ROOT)
class ServiceController extends BaseResourceController {
  List<Resource> resources;

  ServiceController(List<Resource> this.resources);

  @Operation.get()
  Future<Response> getBeerCollection() async {
    ApiRootDto apiroot = new ApiRootDto(resources.map<LinkDto>((Resource resource) {
      // TODO: figure out how to pull protocol from request
      return LinkDto(constructUri(resource.route), resource.rel);
    }).toList());
    return Response.ok(apiroot);
  }
}
