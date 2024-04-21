import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/styles.dart';

class Container2Elements extends StatelessWidget {
  const Container2Elements({
    super.key,
    required this.text,
    required this.firstText,
    required this.style,
  });

  final String firstText;
  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 48,
      decoration: const BoxDecoration(
        color: bluScuro,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(firstText, style: text16Bianco500),
          Text(text, style: style),
        ],
      ),
    );
  }
}
