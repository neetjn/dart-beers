import 'dart:io';
import 'package:aqueduct/aqueduct.dart';
import 'package:colorize/colorize.dart';

import 'package:beers/constants.dart' as constants;
import 'package:beers/beers/core.dart';

void main() async {
  color('Establishing postgres connection within a managed context.', isBold: true, front: Styles.GREEN);
  ManagedDataModel dataModel = ManagedDataModel.fromCurrentMirrorSystem();
  PostgreSQLPersistentStore persistentStore = PostgreSQLPersistentStore.fromConnectionInfo(
    constants.POSTGRES_USER,
    constants.POSTGRES_PASS,
    constants.POSTGRES_HOST,
    constants.POSTGRES_PORT,
    constants.POSTGRES_DATABASE);
  ManagedContext context = ManagedContext(dataModel, persistentStore);

  color('Bootstrapping beers.', isBold: true, front: Styles.GREEN);
  await bootstrapBeers(context);
  color('Beers successfully bootstrapped.', isBold: true, front: Styles.BLUE);
  exit(1);
}
