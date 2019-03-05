# dart-beers

This project was created to learn Dart basics, as well as common use cases from other languages I use on a daily basis. I'll be recording my experiments and what I've learned while treking through Dart.

## Experiments

* [ ] Create a local package, module, or library and utilize it in our entry point.
* [ ] Leverage go package manager for 3rd party packages.
* [ ] Read from a file in a local directory.
* [ ] Create a basic DTO (data transfer object).
* [ ] Marshal and unmarshal DTO to string and Dart structure.
* [ ] Expose REST endpoints for the experiment application.
* [ ] Create a service description for my REST endpoints, following the HATEOAS model.
* [ ] Handle multiple different HTTP verbs.
* [ ] Handle and manipulate different media types.
* [ ] Experiment with decorators for simplifying common REST features.
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


## Closing Thoughts

...

## Resources

* Why Flutter Uses Dart - https://hackernoon.com/why-flutter-uses-dart-dd635a054ebf
* Effective Dart (Code Styling) - https://www.dartlang.org/guides/language/effective-dart

---

Copyright (c) 2019 John Nolette Licensed under the MIT License.
