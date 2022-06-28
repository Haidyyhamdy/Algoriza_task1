import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color background;
  final double width;
  final double height;
  final double radius;
  final VoidCallback onClick;

  const DefaultButton({
    Key? key,
    required this.text,
    required this.onClick,
    this.textColor = Colors.white,
    this.background = Colors.deepOrange,
    this.width = double.infinity,
    this.height = 52,
    this.radius = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
      child: MaterialButton(
        onPressed: onClick,
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
