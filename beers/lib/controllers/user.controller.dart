library beers.controllers.user;

import 'package:aqueduct/aqueduct.dart';

class BeersController extends Controller {
  final _beers = [
    {'id': 11, 'name': 'Captain America'},
    {'id': 12, 'name': 'Ironman'},
    {'id': 13, 'name': 'Wonder Woman'},
    {'id': 14, 'name': 'Hulk'},
    {'id': 15, 'name': 'Black Widow'},
  ];

  @override
  Future<RequestOrResponse> handle(Request request) async {
    return Response.ok(_beers);
  }
}
