library beers.controllers.base;

import 'dart:mirrors';
import 'package:aqueduct/aqueduct.dart';

class Resource {
  final String route;
  final String rel;

  const Resource({this.route, this.rel});
}

class BaseResourceController extends ResourceController {

  Resource _resource;

  BaseResourceController() : super() {
    Resource resource = Resource(
      route: metadata.getField(#route).reflectee,
      rel: metadata.getField(#rel).reflectee);
    this._resource = resource;
  }

  InstanceMirror get metadata {
    ClassMirror instance = reflectClass(this.runtimeType);
    InstanceMirror metadata = instance.metadata.first;
    return metadata;
  }

  Resource get resource {
    return _resource;
  }

  void GenerateRoute(Router router) {
    router.route(this.resource.route).link(() => this);
  }
}
