library beers.models.beer;

import 'package:aqueduct/aqueduct.dart';

class Beer extends ManagedObject<_Beer> implements _Beer{
  @Serialize()
  String href;
}

class _Beer {
  @primaryKey
  int id;

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
