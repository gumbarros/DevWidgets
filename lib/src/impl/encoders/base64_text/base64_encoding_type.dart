import 'package:dev_widgets/src/impl/described_enum.dart';

enum Base64EncodingType implements DescribedEnum {
  utf8("UTF-8"),
  ascii("ASCII");

  @override
  final String description;

  const Base64EncodingType(this.description);
}
