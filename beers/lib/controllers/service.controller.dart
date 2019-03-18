library beers.controllers.service;

import 'dart:core';
import 'package:aqueduct/aqueduct.dart';

//  TODO: left here, add definition for controller
// add route to/url to method
// import other controllers to construct uri's

class ServiceController extends Controller {
  @override
  Future<RequestOrResponse> handle(Request request) async {
    return Response.ok('');
  }

  @Operation.get()
  Future<Response> getBeerCollection() async {
    return Response.ok('');
  }
}
