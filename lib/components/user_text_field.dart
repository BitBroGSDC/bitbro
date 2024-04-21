import 'package:bitbro/components/button.dart';
import 'package:bitbro/utils/styles.dart';
import 'package:flutter/material.dart';

class UserTextField extends StatelessWidget {
  const UserTextField(
      {super.key,
      this.onPressed,
      this.hintText = 'I\'m interested in...',
      this.backgroundColor = Colors.white,
      this.textStyle = text16Blue300});

  final Function()? onPressed;
  final String hintText;
  final Color backgroundColor;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: 150,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          TextField(
            style: textStyle,
            maxLines: null,
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
            ),
            // come aggiungo un bottone interno?
          ),
          Positioned(
              right: 0,
              bottom: 5,
              child: Button(
                text: "SUBMIT",
                onPressed: onPressed,
                height: 36,
                width: 100,
                alignItemsInCenter: true,
              )),
        ],
      ),
    );
  }
}
