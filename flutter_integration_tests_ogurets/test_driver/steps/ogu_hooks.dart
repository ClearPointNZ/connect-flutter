import 'package:flutter_driver/flutter_driver.dart';
import 'package:ogurets/ogurets.dart';
import 'package:ogurets_flutter/ogurets_flutter.dart';

class Hooks {

  FlutterOgurets _world;
  Hooks(this._world);

  @Before(tag: 'set_counter_to_1')
  void beforeExpression() async {
    final locator = find.byValueKey('increment');
    await _world.driver.tap(locator);
    print('Set counter to 1');
  }

}
