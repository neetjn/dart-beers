// store database connection here
library beers.core;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:aqueduct/aqueduct.dart';

import 'package:beers/models/beer.dart';

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
  List<Future<ManagedObject>> createdBeers = await data.map((var beerData) {
    Beer beer = Beer()
      ..name = beerData['name']
      ..brewery = beerData['brewery']
      ..style = beerData['style']
      ..alcohol = beerData['alcohol'] as double
      ..ibu = beerData['ibu'] as int
      ..srm = beerData['srm'] as int;
    Query query = Query<Beer>(context)
      ..values = beer;
    return query.insert();
  }).toList();
}
