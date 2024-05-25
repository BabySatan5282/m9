import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double? size;
  const Logo({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? 100,
      height: size ?? 100,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Image.asset(
        "assets/logo.jpg",
        fit: BoxFit.cover,
      ),
    );
  }
}
