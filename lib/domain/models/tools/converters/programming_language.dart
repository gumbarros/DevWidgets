import 'package:devtoys/domain/models/described_enum.dart';

enum ProgrammingLanguage implements DescribedEnum {
  dart("Dart");

  final String description;
  const ProgrammingLanguage(this.description);
}
