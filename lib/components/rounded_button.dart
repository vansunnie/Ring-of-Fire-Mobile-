import 'package:flutter/material.dart';
import 'package:ring_of_fire/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  RoundedButton(this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        10.0,
      ),
      child: Material(
        color: kColorLight,
        borderRadius: BorderRadius.circular(
          10.0,
        ),
        elevation: 4.0,
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200,
          height: 42.0,
          child: Text(
            text,
            style: kButtonText,
          ),
        ),
      ),
    );
  }
}
