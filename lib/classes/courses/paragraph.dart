class Paragraph {
  String? text;
  String? image;

  Paragraph({
    this.text,
    this.image,
  }) : assert(text != null || image != null);
}
