import 'package:flutter/material.dart';

class TextControl extends StatelessWidget {
  final Function change;

  TextControl(this.change);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: change,
      child: Text('Click to change'),
      style: TextButton.styleFrom(primary: Colors.orange),
    );
  }
}
