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
  randomMessage([int length=5]) {
    // var str = Dictionary.where((w) => w.length <= 3).map((w) => '${w} ${rnd.nextInt()}');
    var msg = Iterable.generate(length).map((_) => Dictionary[rnd.nextInt(Dictionary.length)]).join(' ');
    return msg;
  }
}

void main() {
  User user = new User('neetjn', 'John Nolette');
  user.message();
  print(user.randomMessage());
}
