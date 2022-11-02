import 'package:dev_widgets/src/impl/text/text_inspector/text_inspector_case_convertion.dart';
import 'package:dev_widgets/src/impl/text/text_inspector/text_inspector_providers.dart';
import 'package:dev_widgets/src/impl/widgets/io_editor/io_editor.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_split_view/multi_split_view.dart';

class TextInspectorPage extends ConsumerWidget {
  const TextInspectorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return SizedBox(
        height: MediaQuery.of(context).size.height - kToolbarHeight,
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("convert".tr(),
                  style: Theme.of(context).textTheme.titleMedium),
              Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed:
                          ref.watch(originalTextProvider) != "" ? () {
                            ref
                                .read(textConverterProvider.notifier)
                                .convert(CaseConvertion.originalText);
                          } : null,
                      child: Text(CaseConvertion.originalText.description),
                    ),
                  ),
                  for (final caseConvertion
                      in CaseConvertion.values.where((c) => c.index > 0))
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: caseConvertion.index !=
                                      ref
                                          .watch(selectedCaseConvertionProvider)
                                          .index ||
                                  (ref.watch(originalTextProvider) == "")
                              ? () {
                                  ref
                                      .read(selectedCaseConvertionProvider
                                          .notifier)
                                      .state = caseConvertion;

                                  ref
                                      .read(textConverterProvider.notifier)
                                      .convert(caseConvertion);
                                }
                              : null,
                          child: Text(caseConvertion.description)),
                    ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.2,
            child: IOEditor(
                resizable: false,
                initialAreas: [Area(weight: 0.7), Area(weight: 0.3)],
                usesCodeControllers: false,
                inputOnChanged: (value) {
                  ref.read(originalTextProvider.notifier).state = "";
                  ref.read(inputTextProvider.notifier).state = value;
                },
                inputController: TextEditingController(
                    text: ref.watch(textConverterProvider)),
                outputChild: Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    margin: const EdgeInsets.all(8.0),
                    height: MediaQuery.of(context).size.height / 1.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("selection".tr(),
                            style: Theme.of(context).textTheme.titleMedium),
                      ],
                    ))),
          ),
        ]));
  }
}
