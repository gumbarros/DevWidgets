import 'package:devtoys/domain/models/described_enum.dart';

enum Indentation implements DescribedEnum {
  oneTab("one_tab"),
  twoSpaces("two_spaces"),
  fourSpaces("four_spaces"),
  compact("compact");

  @override
  final String description;
  const Indentation(this.description);

  @override
  String toString() {
    switch (this) {
      case oneTab:
        return "\t";
      case Indentation.twoSpaces:
        return "  ";
      case Indentation.fourSpaces:
        return "    ";
      default:
        return "";
    }
  }
}
