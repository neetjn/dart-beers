library beers.database;

import 'package:aqueduct/aqueduct.dart';
import 'package:beers/constants.dart';

class ApplicationDatabaseChannel extends ApplicationChannel {
  ManagedContext context;

  @override
  Future prepare() async {
    var dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    var psc = PostgreSQLPersistentStore.fromConnectionInfo(
        POSTGRES_USER, POSTGRES_PASS, POSTGRES_HOST, POSTGRES_PORT, POSTGRES_DATABASE);

    context = ManagedContext(dataModel, psc);
  }
}
