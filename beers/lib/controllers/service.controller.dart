library beers.controllers.service;

import 'dart:core';
import 'package:aqueduct/aqueduct.dart';

import 'package:beers/controllers/beer.controller.dart';
import 'package:beers/controllers/user.controller.dart';

//  TODO: left here, add definition for controller
// add route to/url to method
// import other controllers to construct uri's

class ServiceController extends Controller {
  static final String route = '/';

  final Map routes = {
    'user': UserController.route,
    'beer': UserController.route
  };

  @override
  Future<RequestOrResponse> handle(Request request) async {
    return Response.ok('');
  }

  @Operation.get()
  Future<Response> getBeerCollection() async {

    return Response.ok('');
  }
}
