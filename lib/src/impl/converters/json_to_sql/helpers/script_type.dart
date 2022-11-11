import 'package:dev_widgets/src/impl/described_enum.dart';

enum ScriptType implements DescribedEnum {
  insert("Insert"),
  update("Update"),
  delete("Delete");

  @override
  final String description;
  const ScriptType(this.description);
}
