import 'package:code_text_field/code_text_field.dart';
import 'package:dev_widgets/src/impl/converters/json_to_sql/helpers/data_type.dart';
import 'package:dev_widgets/src/impl/converters/json_to_sql/helpers/script_type.dart';
import 'package:dev_widgets/src/impl/converters/json_to_sql/helpers/table_field.dart';
import 'package:dev_widgets/src/impl/converters/json_to_sql/json_to_sql_converter_providers.dart';
import 'package:dev_widgets/src/impl/helpers.dart';
import 'package:dev_widgets/src/impl/widgets/io_editor/code_editor_wrapper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight/languages/json.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

const exampleJson = """[
  {
    "Id": 1,
    "Name": "My Product",
    "Quantity": 5,
    "Price": 100.0,
    "Color": "Red",
    "ManufacturingDate": "2012-02-27 13:27:00"
  },
  {
    "Id": 2,
    "Name": "My Product 2",
    "Quantity": 2,
    "Price": 12.0,
    "Color": null,
    "Unused": {},
    "ManufacturingDate": "2012-02-27 13:27:00"
  }
]""";

class JsonToSqlConverterOptions extends ConsumerWidget {
  const JsonToSqlConverterOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final fields = ref.watch(fieldListProvider);

    return Container(
        padding: const EdgeInsets.all(8.0),
        height: MediaQuery.of(context).size.height - kToolbarHeight,
        child: ref.watch(isValidJsonProvider)
            ? ListView(
                children: [const _Configuration(), _Fields(fields: fields)],
              )
            : _buildInvalidJsonData(context));
  }
}

class _Fields extends ConsumerWidget {
  const _Fields({
    Key? key,
    required this.fields,
  }) : super(key: key);

  final List<TableField> fields;

  @override
  Widget build(BuildContext context, ref) {
    return YaruSection(headline: "fields".tr(), children: [
      SizedBox(
        height: MediaQuery.of(context).size.height / 2,
        child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return Wrap(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    width: MediaQuery.of(context).size.width / 8,
                    child: TextFormField(
                      initialValue: fields[index].fieldName,
                      onChanged: (value) {
                        ref.read(fieldListProvider.notifier).setFieldName(
                            fieldId: fields[index].fieldId, name: value);
                      },
                      decoration: InputDecoration(
                          border: const UnderlineInputBorder(),
                          labelText: "field_name".tr()),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    width: MediaQuery.of(context).size.width / 8,
                    child: DropdownButtonFormField<DataType>(
                        decoration: InputDecoration(
                            labelText: 'data_type'.tr(),
                            border: const UnderlineInputBorder()),
                        value: fields[index].dataType,
                        items: getDropdownMenuItems<DataType>(DataType.values),
                        onChanged: (selected) {
                          ref.read(fieldListProvider.notifier).setDataType(
                              fieldId: fields[index].fieldId,
                              dataType: selected!);
                        }),
                  ),
                  Visibility(
                    maintainAnimation: true,
                    maintainState: true,
                    maintainSize: true,
                    visible: fields[index].dataType.hasLength,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      width: MediaQuery.of(context).size.width / 12,
                      child: TextFormField(
                        initialValue: fields[index].length?.toString(),
                        onChanged: (value) {
                          ref.read(fieldListProvider.notifier).setFieldLength(
                              fieldId: fields[index].fieldId,
                              length: int.tryParse(value));
                        },
                        decoration: InputDecoration(
                            border: const UnderlineInputBorder(),
                            hintText: "MAX",
                            labelText: "length".tr()),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    width: MediaQuery.of(context).size.width / 8,
                    child: CheckboxListTile(
                        value: fields[index].enabled,
                        onChanged: (value) {
                          ref.read(fieldListProvider.notifier).setFieldEnabled(
                              fieldId: fields[index].fieldId, enabled: value);
                        },
                        title: Text("enabled".tr())),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    width: MediaQuery.of(context).size.width / 8,
                    child: CheckboxListTile(
                        value: fields[index].required,
                        onChanged: (value) {
                          ref.read(fieldListProvider.notifier).setFieldRequired(
                              fieldId: fields[index].fieldId, required: value);
                        },
                        title: Text("required".tr())),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    width: MediaQuery.of(context).size.width / 8,
                    child: CheckboxListTile(
                        value: fields[index].primaryKey,
                        onChanged: (value) {
                          ref
                              .read(fieldListProvider.notifier)
                              .setFieldPrimaryKey(
                                  fieldId: fields[index].fieldId,
                                  primaryKey: value);
                        },
                        title: Text("primary_key".tr())),
                  ),
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemCount: fields.length),
      ),
    ]);
  }
}

class _Configuration extends ConsumerWidget {
  const _Configuration({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return YaruSection(headline: "configuration".tr(), children: [
      YaruRow(
          trailingWidget: Container(
            padding: const EdgeInsets.all(8.0),
            width: MediaQuery.of(context).size.width / 5,
            child: ListTile(
              title: TextFormField(
                initialValue: ref.watch(tableNameProvider),
                onChanged: (value) {
                  ref.read(tableNameProvider.notifier).state = value;
                },
                decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: "table_name".tr()),
              ),
            ),
          ),
          enabled: true,
          actionWidget: const SizedBox.shrink()),
      YaruRow(
          trailingWidget: Row(children: [
            Container(
                padding: const EdgeInsets.all(8.0),
                width: MediaQuery.of(context).size.width / 5,
                child: CheckboxListTile(
                  onChanged: (value) {
                    ref.read(enableCreateTableProvider.notifier).state = value!;
                  },
                  title: const Text("CREATE TABLE"),
                  value: ref.watch(enableCreateTableProvider),
                )),
            Visibility(
              visible: ref.watch(enableCreateTableProvider),
              child: Container(
                  padding: const EdgeInsets.all(8.0),
                  width: MediaQuery.of(context).size.width / 5,
                  child: CheckboxListTile(
                    onChanged: (value) {
                      ref
                          .read(enableCreateTableIfNotExistsProvider.notifier)
                          .state = value!;
                    },
                    title: const Text("IF NOT EXISTS"),
                    value: ref.watch(enableCreateTableIfNotExistsProvider),
                  )),
            ),
          ]),
          enabled: true,
          actionWidget: const SizedBox.shrink()),
      YaruRow(
          trailingWidget: Row(children: [
            Container(
                padding: const EdgeInsets.all(8.0),
                width: MediaQuery.of(context).size.width / 5,
                child: CheckboxListTile(
                  onChanged: (value) {
                    ref.read(enableDropTableProvider.notifier).state = value!;
                  },
                  title: const Text("DROP TABLE"),
                  value: ref.watch(enableDropTableProvider),
                )),
            Visibility(
              visible: ref.watch(enableDropTableProvider),
              child: Container(
                  padding: const EdgeInsets.all(8.0),
                  width: MediaQuery.of(context).size.width / 5,
                  child: CheckboxListTile(
                    onChanged: (value) {
                      ref.read(enableDropTableIfExistsProvider.notifier).state =
                          value!;
                    },
                    title: const Text("IF EXISTS"),
                    value: ref.watch(enableDropTableIfExistsProvider),
                  )),
            ),
          ]),
          enabled: true,
          actionWidget: const SizedBox.shrink()),
      YaruRow(
          trailingWidget: Row(children: [
            Container(
                padding: const EdgeInsets.all(8.0),
                width: MediaQuery.of(context).size.width / 5,
                child: RadioListTile<ScriptType>(
                  groupValue: ref.watch(scriptTypeProvider),
                  onChanged: (value) {
                    ref.read(scriptTypeProvider.notifier).state = value!;
                  },
                  title: const Text("INSERT"),
                  value: ScriptType.insert,
                  controlAffinity: ListTileControlAffinity.trailing,
                )),
            Container(
                padding: const EdgeInsets.all(8.0),
                width: MediaQuery.of(context).size.width / 5,
                child: RadioListTile<ScriptType>(
                  groupValue: ref.watch(scriptTypeProvider),
                  onChanged: (value) {
                    ref.read(scriptTypeProvider.notifier).state = value!;
                  },
                  title: const Text("UPDATE"),
                  value: ScriptType.update,
                  controlAffinity: ListTileControlAffinity.trailing,
                )),
            Container(
                padding: const EdgeInsets.all(8.0),
                width: MediaQuery.of(context).size.width / 5,
                child: RadioListTile<ScriptType>(
                  value: ScriptType.delete,
                  onChanged: (value) {
                    ref.read(scriptTypeProvider.notifier).state = value!;
                  },
                  title: const Text("DELETE"),
                  controlAffinity: ListTileControlAffinity.trailing,
                  groupValue: ref.watch(scriptTypeProvider),
                )),
          ]),
          enabled: true,
          actionWidget: const SizedBox.shrink()),
    ]);
  }
}

Widget _buildInvalidJsonData(BuildContext context) {
  return Center(
      child: YaruSection(
    children: [
      SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2,
        child: CodeEditorWrapper(
          usesCodeControllers: true,
          textEditingController:
              CodeController(language: json, text: exampleJson),
          readOnly: true,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Text(
          "json_to_sql_invalid_json_data".tr(),
          style: Theme.of(context).textTheme.bodyLarge,
        )),
      )
    ],
  ));
}
