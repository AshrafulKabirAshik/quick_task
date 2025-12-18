
import '/core/values/app_values.dart';
import 'package:flutter/material.dart';

class WidgetTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String? helperText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function()? suffixOnTap;
  final Function()? onTap;
  final bool? isEnable;
  final bool? isRequired;
  final bool? obscureText;
  final String? Function(String? value)? validator;
  final int? maxLines;
  final int? maxLength;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Function(String value)? onChanged;

  const WidgetTextField({
    super.key,
    required this.controller,
    required this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixOnTap,
    this.onTap,
    this.isEnable,
    this.obscureText,
    this.validator,
    this.maxLines,
    this.maxLength,
    this.helperText,
    this.keyboardType,
    this.textInputAction,
    this.isRequired,
    this.onChanged,
  });

  @override
  State<WidgetTextField> createState() => _WidgetTextFieldState();
}

class _WidgetTextFieldState extends State<WidgetTextField> {


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      controller: widget.controller,
      onTap: widget.onTap,
      enabled: widget.isEnable,
      clipBehavior: Clip.antiAlias,
      style: Theme.of(context).textTheme.titleSmall!.copyWith(),
      obscureText: widget.obscureText ?? false,
      maxLines: widget.maxLines ?? 1,
      validator: widget.validator,
      maxLength: widget.maxLength,

      onChanged: widget.onChanged,

      textInputAction: widget.textInputAction ?? TextInputAction.next,
      keyboardType: widget.keyboardType,

      decoration: InputDecoration(
        isDense: true,
        filled: false,
        fillColor: Colors.transparent,

        alignLabelWithHint: true,

        helperText: widget.helperText,
        helperStyle: WidgetStateTextStyle.resolveWith((states) {
          if (states.contains(WidgetState.focused)) {
            return Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.grey.shade400);
          } else if (states.contains(WidgetState.error)) {
            return Theme.of(context).textTheme.labelSmall!.copyWith(color: Theme.of(context).colorScheme.error);
          } else {
            return Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.grey.shade400);
          }
        }),

        prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
        prefixIconColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.focused)) {
            return Colors.grey.shade400;
          } else if (states.contains(WidgetState.error)) {
            return Theme.of(context).colorScheme.error;
          } else {
            return Colors.grey.shade400;
          }
        }),

        label: Text.rich(
          TextSpan(
            children: [
              TextSpan(text: widget.label),
              TextSpan(
                text: widget.isRequired ?? false ? ' *' : '',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Theme.of(context).colorScheme.error),
              ),
            ],
          ),
        ),
        labelStyle: WidgetStateTextStyle.resolveWith((states) {
          if (states.contains(WidgetState.focused)) {
            return Theme.of(context).textTheme.titleSmall!.copyWith(color: Theme.of(context).primaryColor);
          } else if (states.contains(WidgetState.error)) {
            return Theme.of(context).textTheme.titleSmall!.copyWith(color: Theme.of(context).colorScheme.error);
          } else {
            return Theme.of(context).textTheme.titleSmall!.copyWith();
          }
        }),

        suffixIcon: widget.suffixIcon != null
            ? InkWell(onTap: widget.suffixOnTap, child: Icon(widget.suffixIcon))
            : null,
        suffixIconColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.focused)) {
            return Theme.of(context).primaryColor;
          } else if (states.contains(WidgetState.error)) {
            return Theme.of(context).colorScheme.error;
          } else {
            return Colors.grey.shade400;
          }
        }),

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(AppValues.childCornerRadius),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(AppValues.childCornerRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
          borderRadius: BorderRadius.circular(AppValues.childCornerRadius),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
          borderRadius: BorderRadius.circular(AppValues.childCornerRadius),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
          borderRadius: BorderRadius.circular(AppValues.childCornerRadius),
        ),
      ),
    );
  }
}
