import 'package:flutter/material.dart';

class BorderedLabel extends StatelessWidget {
  final String label;
  final TextStyle? labelStyle;
  final double labelPadding;
  final Color? labelBackground;
  final double? labelBorderRadius;
  final Color? labelBorderColor;
  final bool showLabelBorder;
  final String? hint;
  final TextStyle? hintStyle;
  final Color? hintBackground;
  final double? hintBorderRadius;
  final Color? hintBorderColor;

  const BorderedLabel({
    Key? key,
    required this.label,
    this.labelStyle,
    this.labelPadding = 16.0,
    this.labelBackground,
    this.labelBorderRadius,
    this.labelBorderColor,
    this.showLabelBorder = true,
    this.hint,
    this.hintStyle,
    this.hintBackground,
    this.hintBorderRadius,
    this.hintBorderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
            decoration: BoxDecoration(
              border: showLabelBorder
                  ? Border.all(
                      width: 0.25,
                      color: labelBorderColor ?? Colors.grey.shade600)
                  : null,
              color:
                  labelBackground ?? Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.all(
                Radius.circular(labelBorderRadius ?? 0.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(labelPadding),
              child: Text(
                label,
                style: labelStyle,
              ),
            ),
          ),
        ),
        Positioned(
            top: -1,
            left: 18,
            child: Container(
              decoration: BoxDecoration(
                color:
                    hintBackground ?? Theme.of(context).scaffoldBackgroundColor,
                border: Border.all(
                    width: 0.25, color: hintBorderColor ?? Colors.transparent),
                borderRadius: BorderRadius.all(
                  Radius.circular(hintBorderRadius ?? 0.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: hint != null
                    ? Text(
                        hint!,
                        style: hintStyle,
                      )
                    : const SizedBox.shrink(),
              ),
            )),
      ],
    );
  }
}
