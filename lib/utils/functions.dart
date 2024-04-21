String? parseFloatAndReturnString(double? value) {
  if (value == null) return null;

  String str;

  if (value > 0) {
    str = "+";
  } else {
    str = "";
  }

  str += value.toStringAsFixed(2);

  return str;
}
