import 'package:flutter/material.dart';

class GenereChip extends StatelessWidget {
  const GenereChip({
    super.key,
    required this.title,
    required this.backgroundColor,
  });

  final String title;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      height: 25,
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(20)),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 11),
      ),
    );
  }
}
