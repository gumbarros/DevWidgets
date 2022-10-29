import 'package:dev_widgets/src/described_enum.dart';

enum ConversionMode implements DescribedEnum {
  encode("encode"),
  decode("decode");

  @override
  final String description;

  const ConversionMode(this.description);
}
