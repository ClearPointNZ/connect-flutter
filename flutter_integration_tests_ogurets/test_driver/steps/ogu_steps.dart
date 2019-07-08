import 'package:flutter_driver/flutter_driver.dart';
import 'package:ogurets/ogurets.dart';
import 'package:ogurets_flutter/ogurets_flutter.dart';

class ogu_steps {

  FlutterOgurets _world;

  ogu_steps(this._world);


  @Given(r'I expect the {string} to be {string}')
  void iExpectTheToBe(String input1, String input2) async {
      final locator = find.byValueKey(input1);
      var text = await _world.driver.getText(locator, timeout: Duration(seconds: 2));
      assert(input2 == text, 'Counter should be $input2 but was $text');
    }


  @When(r'I tap the {string} button {int} times')
  void iTapTheButtonTimes(String input1, int input2) async {
    final locator = find.byValueKey(input1);
    for (var i = 0; i < input2; i += 1) {
      await _world.driver.tap(locator);
    }
  }
}
