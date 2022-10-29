import 'package:dev_widgets/src/described_enum.dart';

enum EncodeConversionMode implements DescribedEnum {
  encode("encode"),
  decode("decode");

  @override
  final String description;

  const EncodeConversionMode(this.description);
}
