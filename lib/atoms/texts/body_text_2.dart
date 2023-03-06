import 'package:flutter/material.dart';

class BodyText2 extends StatelessWidget {
  final String value;

  const BodyText2(this.value);

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: Theme.of(context).textTheme.bodyText2,
    );
  }
}
