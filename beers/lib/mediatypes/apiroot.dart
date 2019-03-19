library beers.mediatypes.apiroot;

import 'package:aqueduct/aqueduct.dart';

class LinkDto extends Serializable {
  String href;
  String rel;

  LinkDto([this.href, this.rel]) : super();

  @override
  Map<String, dynamic> asMap() {
    return {
      'href': href,
      'rel': rel
    };
  }

  @override
  void readFromMap(Map<String, dynamic> map) {
    href = map['href'] as String;
    rel = map['rel'] as String;
  }
}

class ApiRootDto extends Serializable {
  List<LinkDto> links;

  ApiRootDto([this.links]) : super();

  @override
  Map<String, dynamic> asMap() {
    return {
      'links': links.map<Map>((link) => link.asMap()).toList()
    };
  }

  @override readFromMap(Map<String, dynamic> map) {
    links = map['links'].map<LinkDto>((link) => LinkDto(link['href'], link['rel'])).toList();
  }
}
