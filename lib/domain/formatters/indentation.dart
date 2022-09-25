enum Indentation {
  OneTab("one_tab"),
  TwoSpaces("two_spaces"),
  FourSpaces("four_spaces");

  final String description;
  const Indentation(this.description);

  @override
  String toString() {
    switch (this) {
      case OneTab:
        return " ";
      case Indentation.TwoSpaces:
        return "  ";
      case Indentation.FourSpaces:
        return "    ";
    }
  }
}
