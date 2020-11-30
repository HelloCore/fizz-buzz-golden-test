import 'package:flutter/material.dart';

enum FizzBuzzButtonType {
  fizz,
  buzz,
  number,
  fizzBuzz,
}

class FizzBuzzButton extends StatelessWidget {
  final void Function(FizzBuzzButtonType) onPressed;
  final FizzBuzzButtonType type;
  final int number;

  const FizzBuzzButton(
      {Key key, this.onPressed, @required this.type, this.number})
      : assert(
            (type == FizzBuzzButtonType.number && number != null) ||
                type != FizzBuzzButtonType.number,
            'Please provide number for type FizzBuzzButtonType.number'),
        super(key: key);

  String _title() {
    switch (type) {
      case FizzBuzzButtonType.number:
        return number.toString();

      case FizzBuzzButtonType.fizz:
        return 'Fizz';

      case FizzBuzzButtonType.buzz:
        return 'Buzz';

      case FizzBuzzButtonType.fizzBuzz:
        return 'FizzBuzz!';

      default:
        assert(false, 'invalid type');
        return '';
    }
  }

  Color _color() {
    switch (type) {
      case FizzBuzzButtonType.number:
        return Colors.lightGreenAccent;

      case FizzBuzzButtonType.fizz:
        return Colors.lightBlueAccent;

      case FizzBuzzButtonType.buzz:
        return Colors.greenAccent;

      case FizzBuzzButtonType.fizzBuzz:
        return Colors.redAccent;

      default:
        assert(false, 'invalid type');
        return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1.0),
          borderRadius: BorderRadius.circular(10),
          color: _color()),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () {
            onPressed(type);
          },
          child: Center(child: Text(_title())),
        ),
      ),
    );
  }
}
