library beers.controllers.beer;

import 'package:aqueduct/aqueduct.dart';
import 'package:beers/constants.dart' as constants;
import 'package:beers/models/beer.model.dart';
import 'package:beers/controllers/base.controller.dart';

@Resource(route: constants.ServiceRouteDef.BEER, rel: constants.ServiceRelDef.BEER)
class BeerController extends BaseResourceController {
  final ManagedContext context;

  BeerController(this.context);

  @Operation.get('id')
  Future<Response> getBeerResource(@Bind.path('id') String id) async {
    Query query = Query<Beer>(context)
      ..where((b) => b.id).equalTo(id);
    Beer beer = await query.fetchOne();
    return Response.ok(beer);
  }
}

@Resource(route: constants.ServiceRouteDef.BEERS, rel: constants.ServiceRelDef.BEERS)
class BeerCollectionController extends BaseResourceController {
  final ManagedContext context;

  BeerCollectionController(this.context);

  @Operation.get()
  Future<Response> getBeerCollection() async {
    Query query = Query<Beer>(context)
      ..pageBy((b) => b.id, QuerySortOrder.ascending);
    List<Beer> beers = await query.fetch();
    return Response.ok(beers);
  }
}
