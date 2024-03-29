import 'package:dev_widgets/src/impl/brazil/cpf_cnpj/cpf_cnpj_generation_mode.dart';
import 'package:dev_widgets/src/impl/brazil/cpf_cnpj/cpf_cnpj_providers.dart';
import 'package:dev_widgets/src/impl/widgets/io_editor/output_editor.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class CpfCnpjGeneratorPage extends HookConsumerWidget {
  final GenerationMode mode;

  const CpfCnpjGeneratorPage({super.key, required this.mode});

  @override
  Widget build(BuildContext context, ref) {
    final outputController = useTextEditingController();

    useEffect(() {
      Future(() => outputController.text = ref.watch(cpfCnpjGeneratorProvider));
      return;
    }, [ref.watch(cpfCnpjGeneratorProvider)]);

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
                    leadingWidget: const Icon(Icons.more_horiz),
                    trailingWidget: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: ListTile(title: Text("format".tr())),
                    ),
                    actionWidget: Switch(
                      onChanged: (value) =>
                          ref.read(isFormattedProvider.notifier).state = value,
                      value: ref.watch(isFormattedProvider),
                    ),
                  ),
                  YaruRow(
                    enabled: true,
                    leadingWidget: const Icon(Icons.format_list_numbered),
                    trailingWidget: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: ListTile(
                          title: Text(StringTranslateExtension("amount").tr())),
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
                                    int.parse(value);
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
                                  .read(cpfCnpjGeneratorProvider.notifier)
                                  .generate(mode),
                              child: Text(
                                  StringTranslateExtension("generate").tr()),
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
                outputController: outputController,
                usesCodeControllers: false,
                actionButtons: [
                  ElevatedButton.icon(
                      icon: const Icon(Icons.clear),
                      label: Text(StringTranslateExtension("clear").tr()),
                      onPressed: () =>
                          ref.read(cpfCnpjGeneratorProvider.notifier).clear())
                ],
              )),
        ],
      ),
    );
  }
}
