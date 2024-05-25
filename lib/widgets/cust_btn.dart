import 'package:flutter/material.dart';

class CustBtn extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? foregroundColor;
  const CustBtn(
      {super.key,
      required this.onPressed,
      this.backgroundColor,
      this.borderColor,
      this.foregroundColor,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: ButtonStyle(
        elevation: const MaterialStatePropertyAll(4),
        backgroundColor:
            MaterialStatePropertyAll(backgroundColor ?? Colors.white10),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            side: BorderSide(color: borderColor ?? Colors.blue, width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: foregroundColor ?? Colors.black),
      ),
    );
  }
}
