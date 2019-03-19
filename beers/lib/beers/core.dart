// store database connection here
library beers.core;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:aqueduct/aqueduct.dart';

import 'package:beers/models/beer.dart';

void bootstrapBeers(ManagedContext context) async {
  // delete existing beers from database
  // context.persistentStore.deleteTable(table)
  // create new table
  // context.persistentStore.createTable(Beer);
  File file = new File('../../../data/beers.json');
  String raw = file.readAsStringSync();
  List<Map> data = json.decode(raw);
  data.forEach((Map beerData) {
    Beer beer = Beer()
      ..name = beerData['name']
      ..brewery = beerData['brewery']
      ..style = beerData['style']
      ..alcohol = beerData['alcohol'] as double
      ..ibu = beerData['ibu'] as int
      ..srm = beerData['srm'] as int;
    final Query query = Query<Beer>(context)
      ..values = beer;
    query.insert();
  });
}
