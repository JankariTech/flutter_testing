import 'dart:async';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';
import 'hooks/hook_example.dart';
//import 'steps/colour_parameter.dart';
//import 'steps/given_I_pick_a_colour_step.dart';
import 'steps/tap_button_n_times_step.dart';
import 'steps/decrement.dart';
import 'package:args/args.dart';

Future<void> main(List<String> arguments) {
  var parser = ArgParser();
  parser.addOption('feature');
  var results = parser.parse(arguments);
  print (results["feature"]);
  final config = FlutterTestConfiguration()
    ..features = [Glob("test_driver/features/" + results["feature"])]
    ..reporters = [
      ProgressReporter(),
      TestRunSummaryReporter(),
      JsonReporter(path: './report.json')
    ] // you can include the "StdoutReporter()" without the message level parameter for verbose log information
    ..hooks = [HookExample()]
    ..stepDefinitions = [TapButtonNTimesStep(), ThenImHappyStep(), DecrementCounterNTimesStep()]
//    ..customStepParameterDefinitions = [ColourParameter()]
    ..restartAppBetweenScenarios = true
    ..targetAppPath = "test_driver/app.dart"
    // ..tagExpression = "@smoke" // uncomment to see an example of running scenarios based on tag expressions
    ..exitAfterTestRun = true; // set to false if debugging to exit cleanly
  return GherkinRunner().execute(config);
}