library beers.controllers.user;

import 'package:aqueduct/aqueduct.dart';
import 'package:beers/controllers/base.controller.dart';

@Resource(route: '/user/[:id]', rel: 'users')
class UserController extends BaseResourceController {
  final ManagedContext context;

  UserController(this.context);

  @override
  Future<RequestOrResponse> handle(Request request) async {
    return Response.ok('');
  }
}
