library beers.models.user;

import 'package:aqueduct/aqueduct.dart';

class User extends ManagedObject<_User> implements _User{}

class _User {
  @primaryKey
  String id;

  @Column(unique: true, indexed: true)
  String username;

  @Column()
  String password;

  @Column()
  String salt;

  @Column(unique: true, indexed: true)
  String email;

  @Column()
  double wallet;
}
