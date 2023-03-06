import 'package:flutter/material.dart';

class IconLabeled extends StatelessWidget {
  final IconData icon;
  final String label;

  IconLabeled({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(2),
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 8,
          children: [Icon(icon), Text(label)],
        ));
  }
}
