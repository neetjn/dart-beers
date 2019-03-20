library beers.controllers.user;

import 'package:aqueduct/aqueduct.dart';
import 'package:beers/constants.dart' as constants;
import 'package:beers/models/user.model.dart';
import 'package:beers/controllers/base.controller.dart';

@Resource(route: constants.ServiceRouteDef.USER, rel: constants.ServiceRelDef.USER)
class UserController extends BaseResourceController {
  final ManagedContext context;

  UserController(this.context);

  @Operation.get('id')
  Future<Response> getUserResource(@Bind.path('id') String id) async {
    Query query = Query<User>(context)
      ..where((u) => u.id).equalTo(id);
    User user = await query.fetchOne();
    return Response.ok(user);
  }
}

@Resource(route: constants.ServiceRouteDef.USERS, rel: constants.ServiceRelDef.USERS)
class UserCollectionController extends BaseResourceController {
  final ManagedContext context;

  UserCollectionController(this.context);

  @Operation.get()
  Future<Response> getUserCollection() async {
    Query query = Query<User>(context)
      ..pageBy((u) => u.id, QuerySortOrder.ascending);
    List<User> users = await query.fetch();
    return Response.ok(users);
  }
}
