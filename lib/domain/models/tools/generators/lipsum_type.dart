import 'package:devtoys/domain/models/described_enum.dart';

enum LipsumType implements DescribedEnum {
  words("words"),
  sentences("sentences"),
  paragraphs("paragraphs");

  final String description;
  const LipsumType(this.description);
}
