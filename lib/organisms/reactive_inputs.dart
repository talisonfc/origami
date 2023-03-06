import 'package:flutter/material.dart';
import 'package:origami/molecules/_exports.dart';
import 'package:reactive_forms/reactive_forms.dart';
// import '../molecules/_exports.dart';

class ReactiveInputs extends StatelessWidget {
  final String? formArrayName;
  final FormArray<FormGroup>? formArray;
  final Widget? child;
  final Widget Function(FormGroup formGroup) buildForm;
  final FormGroup Function() onAdd;
  final Function(int)? onDeleteByIndex;

  const ReactiveInputs(
      {super.key,
      this.formArrayName,
      this.formArray,
      this.child,
      required this.buildForm,
      required this.onAdd,
      this.onDeleteByIndex});

  ReactiveForm _buildFormGroup(BuildContext context,
      {required FormGroup formGroup,
      bool isLast = false,
      VoidCallback? onAdd,
      VoidCallback? onDelete}) {
    return ReactiveForm(
        formGroup: formGroup,
        key: ObjectKey(formGroup),
        child: Row(
          children: [
            buildForm(formGroup),
            const SizedBox(width: 8),
            DeleteIconButton(
              onPressed: onDelete,
            ),
            const SizedBox(width: 8),
            if (isLast)
              AddIconButton(
                onPressed: onAdd,
              )
            else
              const SizedBox(width: 32),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ReactiveFormArray<FormGroup>(
          formArray: formArray,
          formArrayName: formArrayName,
          child: child,
          builder: (context, formArray, child) {
            final forms = (formArray.value ?? []);
            if (forms.isEmpty) {
              return PageState(
                type: PageStateType.empty,
                title: 'Nenhum item',
                action: ButtonWithLoading(
                    label: 'Adicionar',
                    onPressed: () {
                      formArray.value = [onAdd()];
                    }),
              );
            }
            return ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return _buildFormGroup(context,
                    formGroup: forms[index]!,
                    isLast: index == forms.length - 1, onAdd: () {
                  final lastFormGroup = forms.last as FormGroup;
                  if (lastFormGroup.valid) {
                    formArray.value = [...forms, onAdd()];
                  } else {
                    lastFormGroup.markAllAsTouched();
                  }
                }, onDelete: () {
                  if(onDeleteByIndex != null) {
                    onDeleteByIndex!(index);
                  } else {
                    formArray.removeAt(index);
                  }
                });
              },
              itemCount: forms.length,
            );
          }),
    );
  }
}
