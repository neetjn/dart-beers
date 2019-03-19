library beers.controllers.beer;

import 'dart:core';
import 'package:aqueduct/aqueduct.dart';
import 'package:beers/controllers/base.controller.dart';

@Resource(route: '/beers/[:id]', rel: 'beers')
class BeersController extends BaseResourceController {

  final _beers = [
    {'id': 11, 'name': 'Captain America'},
    {'id': 12, 'name': 'Ironman'},
    {'id': 13, 'name': 'Wonder Woman'},
    {'id': 14, 'name': 'Hulk'},
    {'id': 15, 'name': 'Black Widow'},
  ];

  final ManagedContext context;

  BeersController(this.context);

  @override
  Future<RequestOrResponse> handle(Request request) async {
    return Response.ok(_beers);
  }

  @Operation.get()
  Future<Response> getBeerCollection() async {
    return Response.ok(_beers);
  }
}
