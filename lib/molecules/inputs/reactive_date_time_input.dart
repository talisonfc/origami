import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ReactiveDateTimeInput extends StatelessWidget {
  final DateTime firstDate;
  final DateTime lastDate;
  final String formControlName, label;
  final String Function(DateTime)? formatter;

  const ReactiveDateTimeInput(
      {super.key,
      required this.firstDate,
      required this.lastDate,
      required this.formControlName,
      required this.label,
      this.formatter});

  String _format(DateTime? date) {
    if (date == null) {
      return '';
    }
    if (formatter != null) {
      return formatter!(date);
    }
    return '${date.day}/${date.month}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveDatePicker<DateTime>(
        formControlName: formControlName,
        builder: (context, delegate, child) {
          return TextField(
            controller:
                TextEditingController(text: _format(delegate.control.value)),
            decoration: InputDecoration(
              labelText: label,
              suffixIcon: const Icon(Icons.calendar_month_outlined),
            ),
            onTap: () {
              delegate.showPicker();
            },
          );
        },
        firstDate: firstDate,
        lastDate: lastDate);
  }
}
