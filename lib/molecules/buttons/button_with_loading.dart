import 'package:flutter/material.dart';
import 'button.dart';

class ButtonWithLoading extends StatelessWidget {
  final String label;
  final String? requestingLabel;
  final bool requesting, disabled;
  final Function()? onPressed;

  const ButtonWithLoading(
      {super.key,
      this.onPressed,
      this.requesting = false,
      this.disabled = false,
      required this.label,
      this.requestingLabel});

  @override
  Widget build(BuildContext context) {
    return Button(
        onPressed: !requesting && !disabled ? onPressed : null,
        child: Wrap(
          children: [
            if (requesting && !disabled)
              const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              ),
            if (requesting && !disabled)
              const SizedBox(
                width: 8,
              ),
            Text(!requesting || disabled
                ? label
                : requestingLabel != null
                    ? requestingLabel!
                    : label)
          ],
        ));
  }
}
