import 'dart:async';
import 'dart:io';
import 'dart:convert';

class SwapiRelMap {
  static final String People = 'people';
  static final String Planets = 'planets';
  static final String Films = 'films';
  static final String Species = 'species';
  static final String Vehicles = 'vehicles';
  static final String Starships = 'starships';
}

abstract class Dto {}

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

class PersonDto implements Dto {
  String href;
  String name;
  int height;
  String hairColor;
  String skinColor;
  String eyeColor;
  int birthYear;
  String gender;
  String worldHref;

  PersonDto.fromJson(Map json) {
    this.href = json['url'];
    this.name = json['name'];
    this.height = json['height'];
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
    print(json);
    this.count = json['count'];
    this.items = json['results'].map((result) => new PersonDto.fromJson(result));
  }
}

class SwapiClient {
  final String SwapiBaseUri = 'https://swapi.co/api/';

  Future<Map> _request(String href) async {
    Map content;
    var request = await HttpClient().getUrl(Uri.parse(href));
    var response = await request.close();
    // TODO: left here, resolve issues with transformer
    await response
      .transform(utf8.decoder)
      .transform(json.decoder)
      .listen((contents) {
        print(contents);
        content = contents;
      });
    print(content);
    return content;
  }

  Future<ApiRootDto> getApiRoot() async {
    return await this._request(this.SwapiBaseUri).then((body) {
      return new ApiRootDto.fromJson(body);
    });
  }

  Future<PersonCollectionDto> getPeople(String href) async {
    return await this._request(href).then((body) {
      print(body);
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
  // print(apiRoot);
  // print(apiRoot.links);
  // var peopleHref = apiRoot.links[SwapiRelMap.People];
  // print(peopleHref);
  // PersonCollectionDto people = await client.getPeople(peopleHref);
  // var personHref = people.items[0].href;
  // PersonDto person = await client.getPerson(personHref);
  // print(person);
}
