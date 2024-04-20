class CustomParagraph {
  String? text;
  String? image;

  CustomParagraph({
    this.text,
    this.image,
  }) : assert(text != null || image != null);
}
