import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final Function() onPressed;
  final BorderRadius border;
  final Size? minimumSize;
  final EdgeInsets margin;
  final EdgeInsets? padding;
  final BorderSide? borderSide;
  final Widget child;
  // final

  const CustomButton({
    Key? key,
    required this.color,
    required this.onPressed,
    this.margin = EdgeInsets.zero,
    this.border = BorderRadius.zero,
    this.borderSide,
    this.minimumSize,
    this.padding,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: color,
          side: borderSide,
          shape: RoundedRectangleBorder(
            borderRadius: border,
          ),
          minimumSize: minimumSize,
          // padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          padding: padding,
        ),
        child: child,
      ),
    );
  }
}
