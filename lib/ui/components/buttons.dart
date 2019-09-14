import 'package:flutter/material.dart';

typedef void OnPressed();

class BorderEllipseButton extends StatelessWidget {
  BorderEllipseButton({this.text, this.onPressed});

  final String text;
  final OnPressed onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(text),
      color: Colors.white,
      shape: StadiumBorder(
        side: BorderSide(color: Colors.lightBlueAccent),
      ),
      onPressed: this.onPressed,
    );
  }
}
