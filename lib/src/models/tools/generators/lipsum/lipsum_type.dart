import 'package:dev_widgets/src/models/described_enum.dart';

enum LipsumType implements DescribedEnum {
  words("words"),
  sentences("sentences"),
  paragraphs("paragraphs");

  @override
  final String description;
  const LipsumType(this.description);
}
