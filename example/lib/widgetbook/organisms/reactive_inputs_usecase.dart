import 'package:flutter/material.dart';
import 'package:origami/molecules/_exports.dart';
import 'package:origami/organisms/reactive_inputs.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:widgetbook/widgetbook.dart';

final formArray = fb.array<FormGroup>([
  fb.group({
    'name': FormControl<String>(value: 'John'),
    'age': FormControl<int>(value: 30),
  }),
  fb.group({
    'name': FormControl<String>(value: 'Jane'),
    'age': FormControl<int>(value: 25),
  }),
]);

final reactiveInputsUsecase = WidgetbookUseCase(
    name: 'ReactiveInputs',
    builder: (context) {
      return ReactiveInputs(
        formArray: formArray,
        onAdd: () {
          return fb.group({
            'name': FormControl<String>(
                value: '', validators: [Validators.required]),
            'age': FormControl<int>(),
          });
        },
        buildForm: (formGroup) {
          return Expanded(
              child: Wrap(
            children: [
              ReactiveInput(
                label: 'Nome',
                formControlName: 'name',
              ),
              ReactiveInput(
                label: 'Age',
                formControlName: 'age',
              )
            ],
          ));
        },
      );
    });
