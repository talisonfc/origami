import 'package:flutter/material.dart';
import 'package:origami/molecules/_exports.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:widgetbook/widgetbook.dart';

class Category {
  final String id;
  final String name;

  const Category({required this.id, required this.name});
}

final reactiveInputUseCase = WidgetbookUseCase(
    name: 'ReactiveInput',
    builder: (context) {
      return Center(
        child: ReactiveForm(
            formGroup: fb.group({
              'firstName': FormControl<String>(
                  validators: [Validators.required, Validators.minLength(5)]),
              'secondName': FormControl<String>(
                  validators: [Validators.required, Validators.minLength(5)]),
              'category':
                  FormControl<Category>(validators: [Validators.required]),
              'date': FormControl<DateTime>(validators: [Validators.required]),
            }),
            child: ListView(
              shrinkWrap: true,
              children: [
                const ReactiveInput(
                  formControlName: 'firstName',
                  label: 'Primeiro nome',
                ),
                const ReactiveInput(
                  formControlName: 'secondName',
                  label: 'Segundo nome',
                ),
                ReactiveDropdown(
                  formControlName: 'category',
                  label: 'Categoria',
                  isLoading: context.knobs
                      .boolean(label: 'isLoading', initialValue: false),
                  items: const [
                    DropdownMenuItem(
                      value: Category(id: '1', name: 'Categoria 1'),
                      child: Text('Categoria 1'),
                    ),
                    DropdownMenuItem(
                      value: Category(id: '2', name: 'Categoria 2'),
                      child: Text('Categoria 2'),
                    ),
                  ],
                ),
                ReactiveDateTimeInput(
                    formControlName: 'date',
                    label: 'Data',
                    firstDate: DateTime.now().subtract(const Duration(days: 30)),
                    lastDate: DateTime.now())
              ],
            )),
      );
    });
