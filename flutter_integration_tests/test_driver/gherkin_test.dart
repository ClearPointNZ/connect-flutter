import 'dart:async';

import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:glob/glob.dart';

//import 'steps/hooks.dart';
import 'steps/counter_steps.dart';

Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = [Glob(r"test_driver/features/**.feature")]
    ..reporters = [
      ProgressReporter(),
      TestRunSummaryReporter()
    ] // you can include the "StdoutReporter()" without the message level parameter for verbose log information
    // ..hooks = [HookSteps()]
    ..stepDefinitions = [
      TapButtonNTimesStep(),
    ]
    ..customStepParameterDefinitions = []
    ..restartAppBetweenScenarios = true
    ..targetAppPath = "test_driver/app.dart"
    ..exitAfterTestRun = true; // set to false if debugging to exit cleanly
  // ..tagExpression = "@smoke" // uncomment to see an example of running scenarios based on tag expressions
  return GherkinRunner().execute(config);
}
