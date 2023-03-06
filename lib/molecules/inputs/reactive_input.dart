import 'package:flutter/material.dart';
import 'package:origami/atoms/texts/body_text_1.dart';
import 'package:origami/atoms/texts/caption.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ReactiveInput extends StatelessWidget {
  final String label;
  final String? placeholder, formControlName;
  final Map<String, String Function(Object)> validationMessages;
  final TextInputType? keyboardType;

  const ReactiveInput(
      {super.key,
      this.formControlName,
      required this.label,
      this.placeholder,
      this.keyboardType,
      this.validationMessages = const {}});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReactiveTextField(
          formControlName: formControlName,
          validationMessages: {
            'required': (_) => 'Preenchimento obrigatório',
            'minLength': (info) {
              return 'Tamanho mínimo de ${(info as Map)['requiredLength']} caracteres';
            },
            'maxLength': (info) {
              return 'Tamanho máximo de ${(info as Map)['requiredLength']} caracteres';
            },
            ...validationMessages
          },
          decoration: InputDecoration(
            label: Text(label),
            
          ),
          keyboardType: keyboardType,
        ),
      ],
    );
  }
}
