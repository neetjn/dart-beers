library beers.lib.constants;

import 'package:aqueduct/aqueduct.dart';

class Beer extends ManagedObject<_Beer> implements _Beer{}

// essentially a DAO?
// add documentation for what's going on with the -
// @ symbol/decorator
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
