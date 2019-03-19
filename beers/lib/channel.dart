import 'beers.dart';
import 'package:beers/constants.dart' as constants;
import 'package:beers/beers/core.dart';
import 'package:beers/controllers/base.controller.dart';
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

    if (constants.APP_TEST) {
      await bootstrapBeers(context);
    }
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

    List<BaseResourceController> controllers = [
      BeersController(context),
      UserController(context)
    ];

    // generate routes for all provided controllers
    controllers.forEach((BaseResourceController controller) {
      controller.GenerateRoute(router);
    });

    // define our service descriptor once all other routes have been defined.
    ServiceController(controllers.map<Resource>((BaseResourceController ctrl) => ctrl.resource).toList()).GenerateRoute(router);

    return router;
  }
}
