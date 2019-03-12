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

class ApiRootDto {
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

class PersonDto {
  String name;
  int height;
  String hairColor;
  String skinColor;
  String eyeColor;
  int birthYear;
  String gender;
  String worldHref;

  PersonDto.fromJson(Map json) {
    this.name = json['name'];
    this.height = json['height'];
    this.hairColor = json['hair_color'];
    this.skinColor = json['skin_color'];
    this.eyeColor = json['eye_color'];
    this.birthYear = json['birth_year'];
    this.gender = json['gender'];
    this.worldHref = json['homeworld'];
  }
}

class PersonCollectionDto {
  int count;
  List<PersonDto> items;

  PersonCollectionDto.fromJson(Map json) {
    this.count = json['count'];
    this.items = json['results'].map((result) => new PersonDto.fromJson(result));
  }
}

class SwapiClient {
  final Uri SwapiBaseUri = Uri.parse('https://swapi.co/api/');
  ApiRootDto apiRoot;

  SwapiClient() {
    HttpClient()
      .getUrl(this.SwapiBaseUri)
      .then((request) => request.close())
      .then((response) {
        response.transform(Utf8Decoder()).listen((body) {
          var _json = json.decode(body);
          this.apiRoot = ApiRootDto.fromJson(_json);
        });
      });
  }

  PersonCollectionDto getPeople(String href) {

  }

  PersonDto getPerson(String href) {

  }
}


Uri peopleUri;

void main() {
  SwapiClient client = new SwapiClient();
  var peopleLink = client.apiRoot.links[SwapiRelMap.People];
  PersonCollectionDto = client.getPeople(peopleLink);
  PersonDto person = client.getPerson();
}
