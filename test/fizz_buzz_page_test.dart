import 'package:fizz_buzz_golden/fizz_buzz_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  group('fizz_buzz_page', () {
    Widget page;
    setUp(() {
      page = FizzBuzzPage();
    });

    testGoldens('default', (tester) async {
      await tester.pumpWidgetBuilder(page);
      await multiScreenGolden(tester, 'fizz_buzz_page/default');
    });

    testGoldens('correct', (tester) async {
      await tester.pumpWidgetBuilder(page, surfaceSize: Device.phone.size);
      await tester.tap(find.text('1'));
      await multiScreenGolden(tester, 'fizz_buzz_page/correct');
    });

    testGoldens('multiple_correct', (tester) async {
      await tester.pumpWidgetBuilder(page, surfaceSize: Device.phone.size);
      await tester.tap(find.text('1'));
      await tester.pump();
      await tester.tap(find.text('2'));
      await tester.pump();
      await tester.tap(find.text('Fizz'));
      await tester.pump();
      await tester.tap(find.text('4'));
      await tester.pump();
      await tester.tap(find.text('Buzz'));
      await tester.pump();
      await tester.tap(find.text('Fizz'));
      await tester.pump();
      await tester.tap(find.text('7'));
      await tester.pump();
      await tester.tap(find.text('8'));
      await tester.pump();
      await tester.tap(find.text('Fizz'));
      await tester.pump();
      await tester.tap(find.text('FizzBuzz!'));
      await tester.pump();
      await multiScreenGolden(tester, 'fizz_buzz_page/multiple_correct');
    });

    testGoldens('incorrect', (tester) async {
      await tester.pumpWidgetBuilder(page, surfaceSize: Device.phone.size);
      await tester.tap(find.text('Fizz'));
      await multiScreenGolden(tester, 'fizz_buzz_page/incorrect');
    });

    testGoldens('multiple_incorrect', (tester) async {
      await tester.pumpWidgetBuilder(page, surfaceSize: Device.phone.size);
      await tester.tap(find.text('Fizz'));
      await tester.tap(find.text('Buzz'));
      await tester.tap(find.text('Fizz'));
      await tester.tap(find.text('Buzz'));
      await tester.tap(find.text('Fizz'));
      await tester.tap(find.text('Buzz'));
      await tester.tap(find.text('Fizz'));
      await tester.tap(find.text('Buzz'));
      await tester.tap(find.text('Fizz'));
      await tester.tap(find.text('Buzz'));
      await tester.tap(find.text('Fizz'));
      await tester.tap(find.text('Buzz'));

      await multiScreenGolden(tester, 'fizz_buzz_page/multiple_incorrect');
    });
  });
}
