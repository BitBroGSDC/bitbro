import 'package:bitbro/utils/colors.dart';
import 'package:bitbro/utils/styles.dart';
import 'package:flutter/material.dart';

/// Bottone generico con splash effect, icone prefix e suffix opzionali. Stili customizzabili.
/// Espandbile, contenuto centrabile.
///
/// [backgroundColor] colore di sfondo del bottone
/// [prefix] icona da posizionare a sinistra del testo
/// [suffix] icona da posizionare a destra del testo
/// [iconsColor] colore delle icone
/// [text] testo del bottone
/// [onPressed] funzione da eseguire al click
/// [height] altezza del bottone
/// [isExpandable] se true il bottone occupa tutto lo spazio disponibile
/// [borderColor] colore del bordo del bottone
/// [textStyle] stile del testo
/// [alignItemsInCenter] se true allinea gli elementi che ci sono al centro
///
class Button extends StatelessWidget {
  const Button({
    super.key,
    this.backgroundColor = bluScuro,
    this.iconsColor = bianco,
    this.prefix,
    this.suffix,
    required this.text,
    required this.onPressed,
    this.height = 52,
    this.isExpandable = true,
    this.borderColor,
    this.textStyle = text14Bianco500,
    this.alignItemsInCenter = false,
    this.isEnabled = true,
    this.borderRadius,
  })  : assert(
          //se non è espandibile non puoi centrare gli elementi
          !(isExpandable == false && alignItemsInCenter == true),
        ),
        _backgroundColor =
            isEnabled ? backgroundColor : griginoSfondo, // colore da rivedere
        _borderColor = isEnabled ? borderColor : null,
        _textStyle = isEnabled ? textStyle : text14BluScuro500,
        _iconsColor = isEnabled ? iconsColor : Colors.white,
        _borderRadius = borderRadius ?? 16;

  final Color backgroundColor;
  final IconData? prefix;
  final IconData? suffix;
  final Color iconsColor;
  final String text;
  final void Function()? onPressed;
  final double height;
  final bool? isExpandable;
  final Color? borderColor;
  final TextStyle? textStyle;
  final bool alignItemsInCenter;
  final bool isEnabled;
  final double? borderRadius;

  final Color _backgroundColor;
  final Color? _borderColor;
  final TextStyle? _textStyle;
  final Color _iconsColor;
  final double _borderRadius;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: _backgroundColor,
        side: _borderColor != null
            ? BorderSide(color: _borderColor!, width: 1)
            : null,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
      ),
      onPressed: onPressed,
      child: Container(
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: alignItemsInCenter == true
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          mainAxisSize:
              isExpandable == true ? MainAxisSize.max : MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (prefix != null)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  prefix,
                  color: _iconsColor,
                ),
              ),
            isExpandable == true && alignItemsInCenter == false
                ? Expanded(
                    child: Text(
                      text,
                      style: _textStyle,
                    ),
                  )
                : Text(
                    text,
                    style: _textStyle,
                  ),
            if (suffix != null)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(suffix, color: _iconsColor),
              ),
          ],
        ),
      ),
    );
  }
}
