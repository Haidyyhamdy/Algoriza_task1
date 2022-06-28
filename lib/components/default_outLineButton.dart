import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DefaultOutLineButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onClick;
  const DefaultOutLineButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 52,
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            side: BorderSide(color: Colors.deepOrange)),
        onPressed: onClick,
        icon: FaIcon(
          icon,
          size: 25,
          color: Colors.deepOrange,
        ),
        label: Text(text),
      ),
    );
  }
}
