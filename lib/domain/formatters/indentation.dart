enum Indentation {
  OneTab("one_tab"),
  TwoSpaces("two_spaces"),
  FourSpaces("four_spaces"),
  Compact("compact");

  final String description;
  const Indentation(this.description);

  @override
  String toString() {
    switch (this) {
      case OneTab:
        return "\t";
      case Indentation.TwoSpaces:
        return "  ";
      case Indentation.FourSpaces:
        return "    ";
      default:
        return "";
    }
  }
}
