library beers.controllers.user;

import 'package:aqueduct/aqueduct.dart';
import 'package:beers/constants.dart' as constants;
import 'package:beers/controllers/base.controller.dart';

@Resource(route: constants.ServiceRouteDef.USERS, rel: constants.ServiceRelDef.USERS)
class UserController extends BaseResourceController {
  final ManagedContext context;

  UserController(this.context);

  @override
  Future<RequestOrResponse> handle(Request request) async {
    return Response.ok('');
  }
}
