import 'package:flutter/material.dart';

class TitleHeader extends StatelessWidget {
  final String title;

  TitleHeader(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: 26.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
