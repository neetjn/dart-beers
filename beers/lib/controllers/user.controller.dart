library beers.controllers.user;

import 'package:aqueduct/aqueduct.dart';

class UserController extends Controller {
  static final String route = '/user/:id';

  @override
  Future<RequestOrResponse> handle(Request request) async {
    return Response.ok('');
  }
}
