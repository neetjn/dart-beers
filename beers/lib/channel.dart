import 'beers.dart';
import 'package:beers/constants.dart' as constants;
import 'package:beers/controllers/beer.controller.dart';
import 'package:beers/controllers/user.controller.dart';
import 'package:beers/controllers/service.controller.dart';

/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class BeersChannel extends ApplicationChannel {
  ManagedContext context;

  /// Initialize services in this method.
  ///
  /// Implement this method to initialize services, read values from [options]
  /// and any other initialization required before constructing [entryPoint].
  ///
  /// This method is invoked prior to [entryPoint] sbeing accessed.
  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));

    ManagedDataModel dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    PostgreSQLPersistentStore persistentStore = PostgreSQLPersistentStore.fromConnectionInfo(
      constants.POSTGRES_USER,
      constants.POSTGRES_PASS,
      constants.POSTGRES_HOST,
      constants.POSTGRES_PORT,
      constants.POSTGRES_DATABASE);
    context = ManagedContext(dataModel, persistentStore);
  }

  /// Construct the request channel.
  ///
  /// Return an instance of some [Controller] that will be the initial receiver
  /// of all [Request]s.
  ///
  /// This method is invoked after [prepare].
  @override
  Controller get entryPoint {
    final router = Router();

    // BeersController.

    router
      .route(BeersController.route)
      .link(() => ServiceController());

    router
      .route('/beers/[:id]')
      .link(() => BeersController(context));

    router
      .route('/user/[:id]')
      .link(() => UserController(context))

    return router;
  }
}
