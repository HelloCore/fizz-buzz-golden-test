import 'package:fizz_buzz_golden/widgets/fizz_buzz_button.dart';
import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  testGoldens('fizz_buzz_button', (tester) async {
    final builder = GoldenBuilder.column(bgColor: Colors.white)
      ..addScenario(
          'number', FizzBuzzButton(type: FizzBuzzButtonType.number, number: 1))
      ..addScenario('other number',
          FizzBuzzButton(type: FizzBuzzButtonType.number, number: 999))
      ..addScenario('fizz', FizzBuzzButton(type: FizzBuzzButtonType.fizz))
      ..addScenario('buzz', FizzBuzzButton(type: FizzBuzzButtonType.buzz))
      ..addScenario(
          'fizzBuzz', FizzBuzzButton(type: FizzBuzzButtonType.fizzBuzz));

    await tester.pumpWidgetBuilder(builder.build(),
        surfaceSize: Size(150, 800));
    await screenMatchesGolden(
      tester,
      'fizz_buzz_button',
    );
  });
}
