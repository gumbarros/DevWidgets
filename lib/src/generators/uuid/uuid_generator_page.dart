import 'package:dev_widgets/src/generators/uuid/uuid_generator_providers.dart';
import 'package:dev_widgets/src/generators/uuid/uuid_type.dart';
import 'package:dev_widgets/src/widgets/default_app_bar.dart';
import 'package:dev_widgets/src/helpers.dart';
import 'package:dev_widgets/src/widgets/io_editor/output_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class UuidGeneratorPage extends ConsumerWidget {
  const UuidGeneratorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
        appBar: DefaultAppBar(title: "uuid_generator".tr()),
        body: SizedBox(
          height: MediaQuery.of(context).size.height - kToolbarHeight,
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.all(8.0),
                child: YaruSection(
                    headline: StringTranslateExtension("configuration").tr(),
                    children: [
                      YaruRow(
                        enabled: true,
                        leadingWidget: const Icon(Icons.tag),
                        trailingWidget: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: ListTile(
                            title: Text(
                                StringTranslateExtension("uuid_type").tr()),
                            subtitle: Text(StringTranslateExtension(
                                    "uuid_type_description")
                                .tr()),
                          ),
                        ),
                        actionWidget: DropdownButton<UuidType>(
                            value: ref.watch(uuidTypeProvider),
                            items:
                                getDropdownMenuItems<UuidType>(UuidType.values),
                            onChanged: (selected) => ref
                                .read(uuidTypeProvider.notifier)
                                .state = selected!),
                      ),
                      YaruRow(
                        enabled: true,
                        leadingWidget: const Icon(Icons.remove),
                        trailingWidget: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: ListTile(
                            title: Text("hyphens".tr()),
                          ),
                        ),
                        actionWidget: Switch(
                          onChanged: (value) =>
                              ref.read(hiphensProvider.notifier).state = value,
                          value: ref.watch(hiphensProvider),
                        ),
                      ),
                      YaruRow(
                        enabled: true,
                        leadingWidget: const Icon(Icons.format_color_text),
                        trailingWidget: Padding(
                          padding: const EdgeInsets.only(left: 2.0),
                          child: ListTile(title: Text("uppercase".tr())),
                        ),
                        actionWidget: Switch(
                          onChanged: (value) => ref
                              .read(uppercaseProvider.notifier)
                              .state = value,
                          value: ref.watch(uppercaseProvider),
                        ),
                      ),
                      YaruRow(
                        enabled: true,
                        leadingWidget: const Icon(Icons.format_list_numbered),
                        trailingWidget: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: ListTile(
                              title: Text(
                                  StringTranslateExtension("amount").tr())),
                        ),
                        actionWidget: Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Flexible(
                                flex: 1,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  textAlign: TextAlign.end,
                                  initialValue:
                                      ref.watch(amountProvider).toString(),
                                  onChanged: (value) {
                                    ref.read(amountProvider.notifier).state =
                                        int.tryParse(value) ?? 0;
                                  },
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Flexible(
                                flex: 2,
                                child: ElevatedButton(
                                  onPressed: () => ref
                                      .read(uuidGeneratorProvider.notifier)
                                      .generate(),
                                  child: Text(
                                      StringTranslateExtension("generate")
                                          .tr()),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height / 1.2,
                  child: OutputEditor(
                    outputController: TextEditingController(
                        text: ref.watch(uuidGeneratorProvider)),
                    actionButtons: [
                      ElevatedButton.icon(
                        icon: const Icon(Icons.clear),
                        label: Text("clear".tr()),
                        onPressed: () =>
                            ref.read(uuidGeneratorProvider.notifier).clear(),
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}
