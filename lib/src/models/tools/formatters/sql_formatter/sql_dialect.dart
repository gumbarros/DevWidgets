import 'package:dev_widgets/src/models/described_enum.dart';

enum SqlDialect implements DescribedEnum {
  generic("generic_sql");

  @override
  final String description;

  const SqlDialect(this.description);
}
