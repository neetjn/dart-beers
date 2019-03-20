library beers.controllers.user;

import 'package:aqueduct/aqueduct.dart';
import 'package:beers/constants.dart' as constants;
import 'package:beers/beers/core.dart';
import 'package:beers/models/user.model.dart';
import 'package:beers/controllers/base.controller.dart';

@Resource(route: constants.ServiceRouteDef.USER, rel: constants.ServiceRelDef.USER)
class UserController extends BaseResourceController {
  final ManagedContext context;

  UserController(this.context);

  @Operation.get('id')
  Future<Response> getUserResource(@Bind.path('id') String id) async {
    User user = await getUserById(context, id);
    return Response.ok(user);
  }
}

@Resource(route: constants.ServiceRouteDef.USERS, rel: constants.ServiceRelDef.USERS)
class UserCollectionController extends BaseResourceController {
  final ManagedContext context;

  UserCollectionController(this.context);

  @Operation.get()
  Future<Response> getUserCollection() async {
    List<User> users = await getUsers(context);
    return Response.ok(users);
  }
}
