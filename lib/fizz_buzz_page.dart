import 'package:fizz_buzz_golden/widgets/fizz_buzz_button.dart';
import 'package:flutter/material.dart';

class FizzBuzzPage extends StatefulWidget {
  @override
  _FizzBuzzPageState createState() => _FizzBuzzPageState();
}

class _FizzBuzzPageState extends State<FizzBuzzPage> {
  var _score = 0;
  var _miss = 0;

  void _onPressed(FizzBuzzButtonType type) {
    FizzBuzzButtonType target;
    final targetNo = _score + 1;
    if (targetNo % 3 == 0 && targetNo % 5 == 0) {
      target = FizzBuzzButtonType.fizzBuzz;
    } else if (targetNo % 3 == 0) {
      target = FizzBuzzButtonType.fizz;
    } else if (targetNo % 5 == 0) {
      target = FizzBuzzButtonType.buzz;
    } else {
      target = FizzBuzzButtonType.number;
    }

    setState(() {
      if (type == target) {
        _score += 1;
      } else {
        _miss += 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Fizz Buzz'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Center(
                child: Text(
              'Score $_score (-$_miss)',
              style: Theme.of(context).textTheme.headline3,
            )),
            Expanded(
                child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: [
                FizzBuzzButton(
                    type: FizzBuzzButtonType.number,
                    number: _score + 1,
                    onPressed: _onPressed),
                FizzBuzzButton(
                  type: FizzBuzzButtonType.fizz,
                  onPressed: _onPressed,
                ),
                FizzBuzzButton(
                  type: FizzBuzzButtonType.buzz,
                  onPressed: _onPressed,
                ),
                FizzBuzzButton(
                  type: FizzBuzzButtonType.fizzBuzz,
                  onPressed: _onPressed,
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
