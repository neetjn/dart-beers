# dart-beers

This project was created to learn Dart basics, as well as common use cases from other languages I use on a daily basis. I'll be recording my experiments and what I've learned while treking through Dart.

> Note: For this project/experiment I'm leveraging [aqueduct](https://aqueduct.io/); *an extensible HTTP framework for building REST APIs on top of the Dart VM*.

## Experiments

* [x] Create a local package, module, or library and utilize it in our entry point.
* [x] Leverage pub package manager for 3rd party packages.
* [x] Read from environmental variables.
* [ ] Read from a file in a local directory.
* [ ] Create a basic DTO (data transfer object).
* [ ] Marshal and unmarshal DTO to string and Dart structure.
* [ ] Expose REST endpoints for the experiment application.
* [ ] Create a service description for my REST endpoints, following the HATEOAS model.
* [ ] Handle multiple different HTTP verbs.
* [ ] Handle and manipulate different media types.
* [ ] Experiment with decorators for simplifying common REST features.
* [ ] Add user authentication functionality.
* [ ] Dockerize application (include 3rd party packages).
* [ ] Create unit tests and execute on a CI/CD platform.
* [ ] Connect to a relational database (Postgres).
* [ ] Connect to a no-sql database (Mongo).

## What I've Learned

* Dart is AOT (Ahead Of Time) compiled to fast, predictable, native code, which allows almost all of Flutter to be written in Dart. This not only makes Flutter fast, virtually everything (including all the widgets) can be customized.

* Dart can also be JIT (Just In Time) compiled for exceptionally fast development cycles and game-changing workflow (including Flutter’s popular sub-second stateful hot reload).

* Dart can be compiled into Javascript, and the standard library includes a wrapper for the DOM. This means both backend and frontend code can be written with Dart.
  * Re: [Dart Platforms](https://www.dartlang.org/guides/platforms)
  * Re: [dart2js](https://webdev.dartlang.org/tools/dart2js)

* Flutter, an SDK developed by Google for building native iOS and Android apps, allows developers to create mobile apps using **just** Dart.

* `pub` is the defacto package manager for Dart. It's officially supported and maintained by Google.
  * Packages can be found here https://pub.dartlang.org/
  * The package manager is very similar to gem (ruby), npm (node), pip/pipenv(python), and dep (go).
  * pub does **not** generate a pubspec file for you (similar to node's package.json or pipenv's pipfile).

* High order programming in Dart is common place. Lambdas are also very similar to Javascript, and there are numerous javascript-like builtin functions ie; map, reduce, filter at your disposal.


  Javascript:

  ```js
  const dictionary = ['Foo', 'Bar', 'Lorem', 'Ipsum'];
  let reversed = dictionary.map(w => w.split('').reverse().join(''))
  ```

  Dart:
  ```dart
  const dictionary = ['Foo', 'Bar', 'Lorem', 'Ipsum'];
  var reversed = dictionary.map((w) => w.split('').reversed.join(''));
  ```

* Typings were shipped with Dart 2, but types are **not** enforced or required. However, typings are available if necessary and the compiler does well to help thwart out any serious semantical problems while debugging.

* Scoping is almost a mesh between both Python and Node. As where in javascript, scopes almost seem to be lost in the sawce, Dart follows an approach similar to Python whilst still leveraging Javascript style closure.

* Dart is **not** a functional language. It is a procedural language with functional aspects. It supports first class functions with many other functional programming constructs.

* Dart, like Python and the new specification of Javascript, supports loose iterators. Take the following Python code for example:

  ```python
  dictionary = [n for n in range(5)]
  # >> 0, 1, 2, 3, 4
  ```

  Dart Translation:

  ```dart
  var dictionary = Iterable.generate(5)
  ```

* Dart code runs in a single thread like Node (using an event loop), however offers asynchronous programming in the form of Futures which are heavily influenced by Javascript style promises. To run code concurrently, you can create an isolate (server) or worker (web).

  Javascript Promise:
  ```js
  function doSomething() {
    return new Promise((resolve, reject) => {
      resolve(5)
    })
  }
  doSomething()
    .then(result => console.log(result))
    .catchError(error => console.error(error))
  ```

  Dart Future:
  ```dart
  Future<int> doSomething() {
    return new Future(() {
      return 5;
    })
  }
  doSomething()
    .then((result) {
      print(result)
    }, onError: (e) {
      // catch error from the initial future
      print(e)
    })
    .catchError((e) {
      // handle error from within the .then callback
      print(e)
    })
  ```

## Closing Thoughts

...

## Resources

* Why Flutter Uses Dart - https://hackernoon.com/why-flutter-uses-dart-dd635a054ebf
* Effective Dart (Code Styling) - https://www.dartlang.org/guides/language/effective-dart
* How to do CRUD with Postgres - https://medium.com/flutterpub/flutter-how-to-do-crud-with-postgresql-part-1-57d8d3652a31
* Dart gets a Type System - https://medium.com/dartlang/dart-gets-a-type-system-6bd3121772de
* Top 10 Array utility methods you should know - https://codeburst.io/top-10-array-utility-methods-you-should-know-dart-feb2648ee3a2

---

Copyright (c) 2019 John Nolette Licensed under the MIT License.
