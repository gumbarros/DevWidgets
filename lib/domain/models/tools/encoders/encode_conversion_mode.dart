import 'package:dev_widgets/domain/models/described_enum.dart';

enum EncodeConversionMode implements DescribedEnum {
  encode("encode"),
  decode("decode");

  @override
  final String description;

  const EncodeConversionMode(this.description);
}
