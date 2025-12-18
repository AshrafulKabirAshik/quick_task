import 'package:flutter/material.dart';

import '../values/app_values.dart';

class WidgetButton extends StatefulWidget {
  final ButtonType? buttonType;
  final bool isLoading;
  final IconData? icon;
  final String label;
  final Function() onPressed;
  final Color? iconColor;
  final Color? labelColor;
  final Color? buttonColor;

  const WidgetButton({
    super.key,
    this.buttonType,
    required this.isLoading,
    this.icon,
    required this.label,
    required this.onPressed,
    this.iconColor,
    this.labelColor,
    this.buttonColor,
  });

  @override
  State<WidgetButton> createState() => _WidgetButtonState();
}

class _WidgetButtonState extends State<WidgetButton> {
  @override
  Widget build(BuildContext context) {
    return widget.buttonType == ButtonType.outline
        ? OutlinedButton.icon(
            onPressed: widget.isLoading ? null : widget.onPressed,
            label: widget.isLoading
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 12, width: 12, child: CircularProgressIndicator(strokeWidth: 2)),
                      SizedBox(width: 8),
                      Text('Please wait', style: Theme.of(context).textTheme.titleSmall!.copyWith()),
                    ],
                  )
                : Text(widget.label, style: Theme.of(context).textTheme.titleSmall!.copyWith(color: widget.labelColor)),

            icon: widget.isLoading == false ? (widget.icon != null ? Icon(widget.icon, color: widget.iconColor) : null) : null,
            style: ButtonStyle(
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.all(Radius.circular(AppValues.childCornerRadius))),
              ),
              side: WidgetStatePropertyAll(BorderSide(color: Colors.grey.shade300)),
              //backgroundColor: WidgetStatePropertyAll(Theme.of(context).primaryColor),
            ),
          )
        : FilledButton.icon(
            onPressed: widget.isLoading ? null : widget.onPressed,
            icon: widget.isLoading == false ? (widget.icon != null ? Icon(widget.icon, color: widget.iconColor) : null) : null,
            label: widget.isLoading
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 12, width: 12, child: CircularProgressIndicator(color: Theme.of(context).primaryColor, strokeWidth: 2)),
                      SizedBox(width: 8),
                      Text(
                        'Please wait',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(color: widget.labelColor ?? Theme.of(context).primaryColor),
                      ),
                    ],
                  )
                : Text(
                    widget.label,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(color: widget.labelColor ?? Theme.of(context).canvasColor),
                  ),
            style: ButtonStyle(
              backgroundColor: WidgetStateColor.resolveWith((states) {
                if (states.contains(WidgetState.disabled)) {
                  return Colors.grey.shade300;
                } else {
                  return widget.buttonColor ?? Theme.of(context).primaryColor;
                }
              }),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.all(Radius.circular(AppValues.childCornerRadius))),
              ),
            ),
          );
  }
}

enum ButtonType { filled, outline }
