import 'package:test/test.dart';

import 'package:beers/constants.dart';
import 'harness/app.dart';

void main() {
  final harness = Harness()..install();

  test("Can request apiroot", () async {
    final response = await harness.agent.get('/');
    expectResponse(response, 200);
  });
}
