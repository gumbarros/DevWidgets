import 'package:devtoys/domain/models/described_enum.dart';

enum EscapeConversionMode implements DescribedEnum {
  Escape("escape"),
  Unescape("unescape");

  final String description;

  const EscapeConversionMode(this.description);
}
