import 'package:flutter/material.dart';

class DefaultTextButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color background;
  final double radius;
  final VoidCallback onClick;

  const DefaultTextButton({
    Key? key,
    required this.text,
    required this.onClick,
    this.textColor = Colors.deepOrange,
    this.background = Colors.white,
    this.radius = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
      child: TextButton(
        onPressed: onClick,
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
