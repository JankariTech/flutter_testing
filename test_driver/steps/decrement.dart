import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class DecrementCounterNTimesStep extends When1WithWorld<int, FlutterWorld> {
  DecrementCounterNTimesStep()
      : super(StepDefinitionConfiguration());

  @override
  Future<void> executeStep(int count) async {
    final locator = find.byTooltip("decrement");
    for (var i = 0; i < count; i += 1) {
      await FlutterDriverUtils.tap(world.driver, locator);
    }
  }

  @override
  RegExp get pattern => RegExp(r"I decrement the counter {int} times");
}