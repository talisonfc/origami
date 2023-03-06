import 'package:flutter/material.dart';

class H5 extends StatelessWidget {
  final String value;

  const H5(this.value);

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: Theme.of(context).textTheme.headline5,
    );
  }
}
