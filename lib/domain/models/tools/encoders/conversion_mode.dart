import 'package:devtoys/domain/models/described_enum.dart';

enum ConversionMode implements DescribedEnum {
  Encode("encode"),
  Decode("decode");

  final String description;

  const ConversionMode(this.description);
}