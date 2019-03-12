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

  SwapiClient() {

  }
}


Uri peopleUri;

void main() {

  HttpClient()
    .getUrl(SwapiBaseUri)
    .then((request) => request.close())
    .then((response) {
      response.transform(Utf8Decoder()).listen((body) {
        var apiRoot = json.decode(body);
        peopleUri = Uri.parse(apiRoot[SwapiRelMap.People]);
        print(peopleUri);
      });
    });


  // HttpClient()
  //   // produces a request object
  //   .getUrl(Uri.parse('https://swapi.co/api/people/1'))
  //   // sends the request
  //   .then((request) => request.close())
  //   // transforms and prints the response
  //   .then((response) {
  //     response.transform(Utf8Decoder()).listen(print);
  //   });
}
