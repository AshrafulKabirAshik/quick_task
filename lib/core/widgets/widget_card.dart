import 'package:flutter/material.dart';

import '../values/app_values.dart';

class WidgetCard extends StatefulWidget {
  final CardType? cardType;
  final double? elevation;
  final List<Widget> child;
  final Color? color;
  final double? borderRadius;
  final double? childPadding;
  final CrossAxisAlignment? crossAxisAlignment;
  final Function()? onTap;

  const WidgetCard({
    super.key,
    this.cardType,
    required this.child,
    this.elevation,
    this.color,
    this.borderRadius,
    this.crossAxisAlignment,
    this.onTap,
    this.childPadding,
  });

  @override
  State<WidgetCard> createState() => _WidgetCardState();
}

class _WidgetCardState extends State<WidgetCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: widget.elevation ?? 0.0,
      shadowColor: Theme.of(context).primaryColor.withAlpha(40),
      margin: EdgeInsets.zero,
      color: widget.cardType == CardType.filled ? (widget.color ?? Theme.of(context).cardColor) : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius ?? AppValues.parentCornerRadius),
        side: BorderSide(color: widget.cardType == CardType.outline ? Colors.grey.shade300 : Colors.transparent),
      ),

      child: InkWell(
        splashColor: Theme.of(context).primaryColor.withAlpha(40),
        highlightColor: Colors.transparent,
        onTap: widget.onTap,
        child: Padding(
          padding: EdgeInsets.all(widget.childPadding ?? AppValues.contentPadding),
          child: Column(crossAxisAlignment: widget.crossAxisAlignment ?? CrossAxisAlignment.start, children: widget.child),
        ),
      ),
    );
  }
}

enum CardType { filled, outline }
