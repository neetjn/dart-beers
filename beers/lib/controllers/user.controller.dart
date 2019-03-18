library beers.controllers.user;

import 'package:aqueduct/aqueduct.dart';

class UserController extends Controller {
  static final String route = '/user/[:id]';

  final ManagedContext context;

  UserController(this.context);

  @override
  Future<RequestOrResponse> handle(Request request) async {
    return Response.ok('');
  }
}
