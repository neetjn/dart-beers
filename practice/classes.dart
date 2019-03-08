import 'dart:math';

var now = new DateTime.now();
Random rnd = new Random(now.millisecondsSinceEpoch);

const Dictionary = ['Hello', 'World', 'Lorem', 'Ipsum', 'General', 'Foo', 'Bar', 'Responsible'];

class User {
  // class attributes/properties
  String username;
  String fullName;

  // basic constructor
  User(this.username, this.fullName) {
    print('New User Created!');
  }

  // string method
  String hello() {
    return 'Hello ${this.username}! Or do you prefer ${this.fullName}?';
  }

  // referencing class instance method
  void message() {
    print(this.hello());
  }

  // anonymous type
  randomMessage() {
    var str = Dictionary.map((f) => f);
    print(str);
    return 5;
  }
}

void main() {
  User user = new User('neetjn', 'John Nolette');
  user.message();
  user.randomMessage();
}
