library beers.controllers.beer;

import 'package:aqueduct/aqueduct.dart';
import 'package:beers/constants.dart' as constants;
import 'package:beers/beers/utils.dart';
import 'package:beers/beers/core.dart';
import 'package:beers/models/beer.model.dart';
import 'package:beers/controllers/base.controller.dart';

@Resource(route: constants.ServiceRouteDef.BEER, rel: constants.ServiceRelDef.BEER)
class BeerController extends BaseResourceController {
  final ManagedContext context;

  BeerController(this.context);

  @Operation.get('id')
  Future<Response> getBeerResource(@Bind.path('id') String id) async {
    Beer beer = await getBeerById(context, id);
    String href = app.uriFromRel(constants.ServiceRelDef.BEER, args: {'id': id});
    return Response.ok(beer);
  }
}

@Resource(route: constants.ServiceRouteDef.BEERS, rel: constants.ServiceRelDef.BEERS)
class BeerCollectionController extends BaseResourceController {
  final ManagedContext context;

  BeerCollectionController(this.context);

  @Operation.get()
  Future<Response> getBeerCollection() async {
    List<Beer> beers = await getBeers(context);
    return Response.ok(beers);
  }
}
