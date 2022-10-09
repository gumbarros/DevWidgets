import 'package:devtoys/domain/models/described_enum.dart';

enum EncodeConversionMode implements DescribedEnum {
  encode("encode"),
  decode("decode");

  final String description;

  const EncodeConversionMode(this.description);
}
