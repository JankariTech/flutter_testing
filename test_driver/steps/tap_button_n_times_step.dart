import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class TapButtonNTimesStep extends When2WithWorld<String, int, FlutterWorld> {
  TapButtonNTimesStep()
      : super(StepDefinitionConfiguration());

  @override
  Future<void> executeStep(String input1, int input2) async {
    final locator = find.byValueKey(input1);
    locator.
    for (var i = 0; i < input2; i += 1) {
      await FlutterDriverUtils.tap(world.driver, locator, timeout: timeout);
    }
  }

  @override
  RegExp get pattern => RegExp(r"I tap the {string} button {int} times");
}


class ThenImHappyStep extends Then {
  ThenImHappyStep()
      : super(StepDefinitionConfiguration());

  @override
  Future<void> executeStep() async {
    print("I'm happy");
  }

  @override
  RegExp get pattern => RegExp(r"I'm happy");
}