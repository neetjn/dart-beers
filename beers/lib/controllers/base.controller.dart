library beers.controllers.base;

import 'dart:mirrors';
import 'package:aqueduct/aqueduct.dart';
import 'package:beers/beers/utils.dart';
import 'package:beers/mediatypes/apiroot.dart';

/// Resource specification for HATEAOS.
class Resource {
  final String route;
  final String rel;

  const Resource({this.route, this.rel});
}

/// Template for information shared umong all services.
class ApplicationContext {
  Router router;
  List<BaseResourceController> controllers;
  List<Resource> resources;

  ApplicationContext(this.router, this.controllers) {
    this.resources = controllers.map<Resource>((BaseResourceController ctrl) => ctrl.resource).toList();
    controllers.forEach((ctrl) {
      ctrl.GenerateRoute(router);
      ctrl.app = this;
    });
  }

  String uriFromRel(String rel, {Map args: null, String protocol: 'http'}) {
    Resource resource = resources.firstWhere((r) => r.rel == rel);
    String uri = constructUri(resource.route, protocol: protocol);
    if (args != null) {
      args.forEach((key, value) {
        String mappedKey = '[:${key}]';
        if (uri.contains(mappedKey)) {
          uri = uri.replaceAll(mappedKey, value);
        }
      });
    }
    return uri;
  }

  ApiRootDto getServiceDescription({String protocol: 'http'}) {
    return new ApiRootDto(resources.map<LinkDto>((Resource resource) {
      return LinkDto(constructUri(resource.route, protocol: protocol), resource.rel);
    }).toList());
  }
}

/// Base definition for resource controller using app context.
class BaseResourceController extends ResourceController {

  ApplicationContext app;
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
