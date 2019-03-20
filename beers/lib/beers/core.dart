// store database connection here
library beers.core;

import 'dart:convert';
import 'dart:io';

import 'package:aqueduct/aqueduct.dart';

import 'package:beers/models/beer.model.dart';
import 'package:beers/models/user.model.dart';

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

void bootstrapUsers(ManagedContext context, {deleteExisting: true}) async {
  if (deleteExisting) {
    Query query = Query<User>(context)
      ..canModifyAllInstances = true;
    await query.delete();
  }

  File file = new File('../data/users.json');
  String raw = file.readAsStringSync();
  // can't cast data type because json decoder uses custom type
  List<dynamic> data = json.decode(raw);
  for(var userData in data) {
    // construct query to check if beer exists by constraint
    Query exists = Query<User>(context)
      ..where((b) => b.username).equalTo(userData['username']);
    // execute query
    final foundUser = await exists.fetchOne();
    // verify beer by constrainted name does not exist
    if (foundUser != null)
      continue;
  }

  // TODO: left here, create and insert user
}

Future<List<Beer>> getBeers(ManagedContext context) async {
  Query query = Query<Beer>(context)
    ..pageBy((b) => b.id, QuerySortOrder.ascending);
  return query.fetch();
}

Future<Beer> getBeerById(ManagedContext context, String id) async {
  print(id);
  Query query = Query<Beer>(context)
    ..where((b) => b.id).equalTo(int.parse(id));
  return query.fetchOne();
}

Future<List<User>> getUsers(ManagedContext context) async {
  Query query = Query<User>(context)
    ..pageBy((u) => u.id, QuerySortOrder.ascending);
  List<User> users = await query.fetch();
  return users;
}

Future<User> getUserById(ManagedContext context, String id) async {
  Query query = Query<User>(context)
    ..where((u) => u.id).equalTo(int.parse(id));
  User user = await query.fetchOne();
  return user;
}
