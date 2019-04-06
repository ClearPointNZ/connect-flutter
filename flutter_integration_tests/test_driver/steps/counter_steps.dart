import 'dart:async';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';


class TapButtonNTimesStep extends When2WithWorld<String, int, FlutterWorld> {
  @override
  Future<void> executeStep(String input1, int input2) async {
    final locator = find.byValueKey(input1);
    for (var i = 0; i < input2; i += 1) {
      await world.driver.tap(locator);
    }
  }

  @override
  RegExp get pattern => RegExp(r"I tap the {string} button {int} times");
}

class IexpectCounterToBe extends When2WithWorld<String, int, FlutterWorld> {
  @override
  Future<void> executeStep(String input1, int input2) async {
    final locator = find.byValueKey(input1);
      var text = await world.driver.getText(locator, timeout: Duration(seconds: 2));
      expect(text, input2.toString());
    }


  @override
  RegExp get pattern => RegExp(r"I expect the {string} to be {int}");
}