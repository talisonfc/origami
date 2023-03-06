import 'package:flutter/material.dart';

class BodyText1 extends StatelessWidget {
  final String value;

  const BodyText1(this.value);

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: Theme.of(context).textTheme.bodyText1,
    );
  }
}
