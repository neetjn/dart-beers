library beers.controllers.beer;

import 'package:aqueduct/aqueduct.dart';
import 'package:beers/constants.dart' as constants;
import 'package:beers/controllers/base.controller.dart';

@Resource(route: constants.ServiceRouteDef.BEERS, rel: constants.ServiceRelDef.BEERS)
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
