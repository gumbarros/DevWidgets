import 'package:dev_widgets/src/impl/described_enum.dart';

enum DataType implements DescribedEnum {
  integer("Integer"),
  number("Number"),
  dateTime("DateTime"),
  bit("Bit"),
  varChar("VarChar"),
  nVarChar("NVarChar");

  @override
  final String description;
  const DataType(this.description);

  bool get hasLength => this == DataType.nVarChar || this == DataType.varChar;

  @override
  String toString() => description.toUpperCase();
}
