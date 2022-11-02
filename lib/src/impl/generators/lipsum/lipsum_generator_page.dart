import 'package:dev_widgets/src/impl/generators/lipsum/lipsum_generator_providers.dart';
import 'package:dev_widgets/src/impl/generators/lipsum/lipsum_type.dart';
import 'package:dev_widgets/src/impl/helpers.dart';
import 'package:dev_widgets/src/impl/widgets/io_editor/output_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class LipsumGeneratorPage extends ConsumerWidget {
  const LipsumGeneratorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return SizedBox(
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
                        leadingWidget: const Icon(Icons.width_normal),
                        trailingWidget: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: ListTile(
                              title: Text(StringTranslateExtension(
                                      "lipsum_generator_mode")
                                  .tr()),
                              subtitle: Text(StringTranslateExtension(
                                      "lipsum_generator_mode_description")
                                  .tr())),
                        ),
                        actionWidget: DropdownButton<LipsumType>(
                            value: ref.watch(lipsumTypeProvider),
                            items: getDropdownMenuItems<LipsumType>(
                                LipsumType.values),
                            onChanged: (selected) => ref
                                .read(lipsumTypeProvider.notifier)
                                .state = selected!),
                      ),
                      YaruRow(
                        enabled: true,
                        leadingWidget: const Icon(Icons.fork_right),
                        trailingWidget: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: ListTile(
                            title: Text(
                                StringTranslateExtension("lipsum_start").tr()),
                          ),
                        ),
                        actionWidget: Switch(
                          onChanged: (value) => ref
                              .read(startWithLoremProvider.notifier)
                              .state = value,
                          value: ref.watch(startWithLoremProvider),
                        ),
                      ),
                      YaruRow(
                        enabled: true,
                        leadingWidget: const Icon(Icons.tag),
                        trailingWidget: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: ListTile(
                            title:
                                Text(StringTranslateExtension("amount").tr()),
                            subtitle: Text(StringTranslateExtension(
                                    "lipsum_amount_description")
                                .tr()),
                          ),
                        ),
                        actionWidget: Flexible(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            textAlign: TextAlign.end,
                            initialValue: ref.watch(amountProvider).toString(),
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
                      ),
                    ]),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height / 1.2,
                  child: OutputEditor(
                    outputController: TextEditingController(
                        text: ref.watch(outputTextProvider)),
                  )),
            ],
          ),
        );
  }
}
