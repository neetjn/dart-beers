library beers.models.beer;

import 'package:aqueduct/aqueduct.dart';

class Beer extends ManagedObject<_Beer> implements _Beer{}

class _Beer {
  @primaryKey
  String id;

  @Column(unique: true, indexed: true)
  String name;

  @Column(indexed: true)
  String brewery;

  @Column()
  String style;

  @Column(indexed: true)
  double alcohol;

  @Column()
  int ibu;

  @Column()
  int srm;
}
