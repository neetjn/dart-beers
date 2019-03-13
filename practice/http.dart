import 'dart:async';
import 'dart:io';
import 'dart:convert';

/// Container for SWAPI resource labels.
///
/// Defines href relations for looking up links.
/// This class is not to be instantiated, it is a static enum.
///
///   String peopleHref = apiRoot[SwapiRelMap.People];
class SwapiRelMap {
  static final String People = 'people';
  static final String Planets = 'planets';
  static final String Films = 'films';
  static final String Species = 'species';
  static final String Vehicles = 'vehicles';
  static final String Starships = 'starships';
}

abstract class Dto {}

/// Container for SWAPI api root.
///
/// Defines links for api resources.
/// Any new links added must be mapped with a label in the SwapiRelMap class.
/// This class implements Dto and provides JSON serialization.
///
///   ApiRootDto apiRoot = new ApiRootDto.fromJson(...);
class ApiRootDto implements Dto {
  Map links;

  ApiRootDto.fromJson(Map json) {
    this.links = {
      SwapiRelMap.People: json[SwapiRelMap.People],
      SwapiRelMap.Planets: json[SwapiRelMap.Planets],
      SwapiRelMap.Films: json[SwapiRelMap.Films],
      SwapiRelMap.Species: json[SwapiRelMap.Species],
      SwapiRelMap.Vehicles: json[SwapiRelMap.Vehicles],
      SwapiRelMap.Starships: json[SwapiRelMap.Starships],
    };
  }
}

///
///
class PersonDto implements Dto {
  String href;
  String name;
  int height;
  String hairColor;
  String skinColor;
  String eyeColor;
  String birthYear;
  String gender;
  String worldHref;

  PersonDto.fromJson(Map json) {
    this.href = json['url'];
    this.name = json['name'];
    this.height = int.parse(json['height']);
    this.hairColor = json['hair_color'];
    this.skinColor = json['skin_color'];
    this.eyeColor = json['eye_color'];
    this.birthYear = json['birth_year'];
    this.gender = json['gender'];
    this.worldHref = json['homeworld'];
  }

  @override
  String toString() {
    return '${this.href} | ${this.name}';
  }
}

class PersonCollectionDto implements Dto {
  int count;
  List<PersonDto> items;

  PersonCollectionDto.fromJson(Map json) {
    this.count = json['count'];
    this.items = json['results'].map<PersonDto>((result) => new PersonDto.fromJson(result)).toList();
  }
}

class SwapiClient {
  final String SwapiBaseUri = 'https://swapi.co/api/';

  Future<Map> _request(String href) async {
    var request = await HttpClient().getUrl(Uri.parse(href));
    var response = await request.close();
    return utf8.decodeStream(response).then((body) => json.decode(body));
  }

  Future<ApiRootDto> getApiRoot() async {
    return await this._request(this.SwapiBaseUri).then((body) {
      return new ApiRootDto.fromJson(body);
    });
  }

  Future<PersonCollectionDto> getPeople(String href) async {
    return await this._request(href).then((body) {
      return new PersonCollectionDto.fromJson(body);
    });
  }

  Future<PersonDto> getPerson(String href) async {
    return await this._request(href).then((body) {
      return new PersonDto.fromJson(body);
    });
  }
}

void main() async {
  SwapiClient client = new SwapiClient();
  ApiRootDto apiRoot = await client.getApiRoot();
  var peopleHref = apiRoot.links[SwapiRelMap.People];
  PersonCollectionDto people = await client.getPeople(peopleHref);
  var personHref = people.items[0].href;
  PersonDto person = await client.getPerson(personHref);
  print(
    'In a land far far away...\n'
    '${person.name} was born in ${person.birthYear}...\n'
    'With ${person.hairColor} colored hair and ${person.eyeColor} eyes.'
  );
  exit(1);
}
