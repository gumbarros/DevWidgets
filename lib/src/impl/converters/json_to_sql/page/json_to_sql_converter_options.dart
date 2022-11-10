import 'package:code_text_field/code_text_field.dart';
import 'package:dev_widgets/src/impl/converters/json_to_sql/helpers/data_type.dart';
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
                children: [
                  YaruSection(headline: "configuration".tr(), children: [
                    YaruRow(
                        trailingWidget: Container(
                          padding: const EdgeInsets.all(8.0),
                          width: MediaQuery.of(context).size.width / 5,
                          child: TextFormField(
                            initialValue: ref.watch(tableNameProvider),
                            onChanged: (value) {
                              ref.read(tableNameProvider.notifier).state =
                                  value;
                            },
                            decoration: InputDecoration(
                                border: const UnderlineInputBorder(),
                                labelText: "table_name".tr()),
                          ),
                        ),
                        enabled: true,
                        actionWidget: const SizedBox.shrink()),
                  ]),
                  YaruSection(headline: "fields".tr(), children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      child: ListView.separated(
                          itemBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: MediaQuery.of(context).size.height / 5,
                              child: ListTile(
                                leading: Text("$index."),
                                title: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(8.0),
                                      width:
                                          MediaQuery.of(context).size.width / 8,
                                      child: TextFormField(
                                        initialValue: fields[index].fieldName,
                                        onChanged: (value) {
                                          ref
                                              .read(fieldListProvider.notifier)
                                              .setFieldName(
                                                  fieldId:
                                                      fields[index].fieldId,
                                                  name: value);
                                        },
                                        decoration: InputDecoration(
                                            border:
                                                const UnderlineInputBorder(),
                                            labelText: "field_name".tr()),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(8.0),
                                      width:
                                          MediaQuery.of(context).size.width / 8,
                                      child: DropdownButtonFormField<DataType>(
                                          decoration: InputDecoration(
                                              labelText: 'data_type'.tr(),
                                              border:
                                                  const UnderlineInputBorder()),
                                          value: fields[index].dataType,
                                          items: getDropdownMenuItems<DataType>(
                                              DataType.values),
                                          onChanged: (selected) {
                                            ref
                                                .read(
                                                    fieldListProvider.notifier)
                                                .setDataType(
                                                    fieldId:
                                                        fields[index].fieldId,
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
                                        width:
                                            MediaQuery.of(context).size.width /
                                                12,
                                        child: TextFormField(
                                          initialValue:
                                              fields[index].length?.toString(),
                                          onChanged: (value) {
                                            ref
                                                .read(
                                                    fieldListProvider.notifier)
                                                .setFieldLength(
                                                    fieldId:
                                                        fields[index].fieldId,
                                                    length:
                                                        int.tryParse(value));
                                          },
                                          decoration: InputDecoration(
                                              border:
                                                  const UnderlineInputBorder(),
                                              hintText: "MAX",
                                              labelText: "length".tr()),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(8.0),
                                      width:
                                          MediaQuery.of(context).size.width / 8,
                                      child: CheckboxListTile(
                                          value: fields[index].enabled,
                                          onChanged: (value) {
                                            ref
                                                .read(
                                                    fieldListProvider.notifier)
                                                .setFieldEnabled(
                                                    fieldId:
                                                        fields[index].fieldId,
                                                    enabled: value);
                                          },
                                          title: Text("enabled".tr())),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(8.0),
                                      width:
                                          MediaQuery.of(context).size.width / 8,
                                      child: CheckboxListTile(
                                          value: fields[index].required,
                                          onChanged: (value) {
                                            ref
                                                .read(
                                                    fieldListProvider.notifier)
                                                .setFieldRequired(
                                                    fieldId:
                                                        fields[index].fieldId,
                                                    required: value);
                                          },
                                          title: Text("required".tr())),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(8.0),
                                      width:
                                          MediaQuery.of(context).size.width / 8,
                                      child: CheckboxListTile(
                                          value: fields[index].primaryKey,
                                          onChanged: (value) {
                                            ref
                                                .read(
                                                    fieldListProvider.notifier)
                                                .setFieldPrimaryKey(
                                                    fieldId:
                                                        fields[index].fieldId,
                                                    primaryKey: value);
                                          },
                                          title: Text("primary_key".tr())),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(),
                          itemCount: fields.length),
                    ),
                  ])
                ],
              )
            : Center(
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
              )));
  }
}
