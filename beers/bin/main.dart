import 'package:beers/beers.dart';
import 'package:beers/constants.dart' as constants;

Future main() async {
  final app = Application<BeersChannel>()
      ..options.address = constants.APP_HOST
      ..options.port = constants.APP_PORT;

  final count = Platform.numberOfProcessors ~/ 2;
  await app.start(numberOfInstances: count > 0 ? count : 1);

  print("Application started on port: ${app.options.port}.");
  print("Use Ctrl-C (SIGINT) to stop running the application.");
}
