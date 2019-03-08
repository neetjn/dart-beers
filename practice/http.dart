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

class SwapiClient {
  final Uri SwapiBaseUri = Uri.parse('https://swapi.co/api/');

  await SwapiClient() {

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
