import 'package:dev_widgets/src/impl/described_enum.dart';

enum ProgrammingLanguage implements DescribedEnum {
  dart("Dart");

  @override
  final String description;
  const ProgrammingLanguage(this.description);
}
