class CustomException implements Exception {
  String cause;
  CustomException(this.cause);
}

void main() {
  // throw 'this is a test';
  // throw Exception('this is a structured exception');
  // try {
  //   throw new CustomException('This is a custom exception');
  // } on CustomException {
  //   print('A custom exception was thrown');
  // }
  try {
    throw CustomException('...');
  } catch(e, stacktrace) {
    print(e);
    print(stacktrace);
  }
}
