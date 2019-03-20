library beers.controllers.service;

import 'dart:core';

import 'package:aqueduct/aqueduct.dart';

import 'package:beers/constants.dart' as constants;
import 'package:beers/beers/utils.dart';
import 'package:beers/mediatypes/apiroot.dart';
import 'package:beers/controllers/base.controller.dart';

@Resource(route: constants.ServiceRouteDef.ROOT, rel: constants.ServiceRelDef.ROOT)
class ServiceController extends BaseResourceController {
  @Operation.get()
  Future<Response> getBeerCollection() async {
    String protocol = protocolFromRequest(request);
    ApiRootDto apiroot = app.getServiceDescription(protocol: protocol);
    return Response.ok(apiroot);
  }
}
