import 'dart:io';
import 'dart:convert';


Future test() {
  return new Future.microtask(() => 5);
}

void main() {
  HttpClient()
    // produces a request object
    .getUrl(Uri.parse('https://swapi.co/api/people/1'))
    // sends the request
    .then((request) => request.close())
    // transforms and prints the response
    .then((response) =>
      response.transform(Utf8Decoder()).listen(print));
}
