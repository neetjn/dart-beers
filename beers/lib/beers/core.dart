// store database connection here
library beers.core;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:aqueduct/aqueduct.dart';

import 'package:beers/models/beer.model.dart';

void bootstrapBeers(ManagedContext context, {deleteExisting: true}) async {
  if (deleteExisting) {
    Query query = Query<Beer>(context)
      ..canModifyAllInstances = true;
    await query.delete();
  }

  File file = new File('../data/beers.json');
  String raw = file.readAsStringSync();
  // can't cast data type because json decoder uses custom type
  List<dynamic> data = json.decode(raw);
  for(var beerData in data) {
    // construct query to check if beer exists by constraint
    Query exists = Query<Beer>(context)
      ..where((b) => b.name).equalTo(beerData['name']);
    // execute query
    final foundBeer = await exists.fetchOne();
    // verify beer by constrainted name does not exist
    if (foundBeer != null)
      continue;

    // construct new beer
    Beer beer = Beer()
      ..name = beerData['name']
      ..brewery = beerData['brewery']
      ..style = beerData['style']
      ..alcohol = beerData['alcohol'] as double
      ..ibu = beerData['ibu'] as int
      ..srm = beerData['srm'] as int;

    print('Bootstrap beer: ${beer.asMap()}');

    // create new beer
    await Query<Beer>(context)
      ..values = beer
      ..insert();
  }
}
