import 'package:flutter/material.dart';

class BorderedButton extends StatelessWidget {
  final String textButton;
  const BorderedButton({
    super.key,
    required this.textButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white),
      ),
      child: TextButton(
        onPressed: () => print('sss'),
        child: Text(textButton, style: Theme.of(context).textTheme.titleMedium),
      ),
    );
  }
}
