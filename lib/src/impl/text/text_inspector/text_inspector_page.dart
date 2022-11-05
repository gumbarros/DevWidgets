import 'package:dev_widgets/src/impl/helpers.dart';
import 'package:dev_widgets/src/impl/text/text_inspector/helpers/count_extension.dart';
import 'package:dev_widgets/src/impl/text/text_inspector/helpers/distribution_extensions.dart';
import 'package:dev_widgets/src/impl/text/text_inspector/text_inspector_case_convertion.dart';
import 'package:dev_widgets/src/impl/text/text_inspector/text_inspector_providers.dart';
import 'package:dev_widgets/src/impl/widgets/io_editor/io_editor.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:multi_split_view/multi_split_view.dart';

class TextInspectorPage extends HookConsumerWidget {
  const TextInspectorPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final controller = useTextEditingController();
    final wordDistributionController = useTextEditingController();
    final characterDistributionController = useTextEditingController();

    useEffect(() {
      controller.text = ref.read(convertedCaseProvider);

      controller.addListener(() {
        Future(() {
          final controllerText = applyWebSpaceFix(controller.text);

          ref.read(selectionOffsetProvider.notifier).state =
              controller.selection.baseOffset;

          ref.read(charactersCountProvider.notifier).state =
              controllerText.characters.length;

          ref.read(wordCountProvider.notifier).state =
              controllerText.countWords();

          ref.read(lineCountProvider.notifier).state =
              controllerText.countLines();

          ref.read(paragraphCountProvider.notifier).state =
              controllerText.countParagraphs();

          ref.read(sentenceCountProvider.notifier).state =
              controllerText.countSentences();

          ref.read(bytesCountProvider.notifier).state =
              controllerText.countBytes();

          ref.read(wordDistributionProvider.notifier).state =
              controllerText.wordDistribution();

          ref.read(characterDistributionProvider.notifier).state =
              controllerText.characterDistribution();

          ref.read(inputTextProvider.notifier).state = controllerText;
        });
      });

      return;
    }, [ref.watch(convertedCaseProvider)]);

    useEffect(() {
      wordDistributionController.text =
          ref.read(wordDistributionProvider).getString();
      characterDistributionController.text =
          ref.read(characterDistributionProvider).getString();

      return;
    }, [ref.watch(inputTextProvider)]);

    return SizedBox(
        height: MediaQuery.of(context).size.height - kToolbarHeight,
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("convert".tr(),
                    style: Theme.of(context).textTheme.titleMedium),
                const _ConvertionButtons(),
              ],
            ),
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height / 1.8,
              child: IOEditor(
                  resizable: false,
                  inputOnChanged: ((value) {
                    ref.read(originalTextProvider.notifier).state = "";
                    ref.read(selectedCaseConvertionProvider.notifier).state =
                        CaseConvertion.originalText;
                  }),
                  initialAreas: [Area(weight: 0.7), Area(weight: 0.3)],
                  usesCodeControllers: false,
                  outputChild: _TextData(
                      wordDistributionController: wordDistributionController,
                      characterDistributionController:
                          characterDistributionController),
                  inputController: controller)),
        ]));
  }
}

class _ConvertionButtons extends ConsumerWidget {
  const _ConvertionButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: ref.watch(originalTextProvider).isNotEmpty
                ? () {
                    convertCase(ref, CaseConvertion.originalText);
                  }
                : null,
            child: Text(CaseConvertion.originalText.description),
          ),
        ),
        for (final caseConvertion
            in CaseConvertion.values.where((c) => c.index > 0))
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: caseConvertion.index !=
                        ref.watch(selectedCaseConvertionProvider).index
                    ? () {
                        convertCase(ref, caseConvertion);
                      }
                    : null,
                child: Text(caseConvertion.description)),
          ),
      ],
    );
  }
}

class _TextData extends ConsumerWidget {
  final TextEditingController wordDistributionController;
  final TextEditingController characterDistributionController;

  const _TextData({
    required this.wordDistributionController,
    required this.characterDistributionController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        surfaceTintColor: Colors.transparent,
        child: Container(
          width: MediaQuery.of(context).size.width / 1.5,
          margin: const EdgeInsets.all(8.0),
          height: MediaQuery.of(context).size.height / 1.5,
          child: ListView(
            children: [
              Text("selection".tr(),
                  style: Theme.of(context).textTheme.titleMedium),
              _TextDataEntry(
                  label: "position".tr(),
                  value: ref.watch(selectionOffsetProvider).toString()),
              const SizedBox(
                height: 10,
              ),
              Text("statistics".tr(),
                  style: Theme.of(context).textTheme.titleMedium),
              _TextDataEntry(
                  label: "characters".tr(),
                  value: ref.watch(charactersCountProvider).toString()),
              _TextDataEntry(
                  label: "words".tr(),
                  value: ref.watch(wordCountProvider).toString()),
              _TextDataEntry(
                  label: "lines".tr(),
                  value: ref.watch(lineCountProvider).toString()),
              _TextDataEntry(
                  label: "sentences".tr(),
                  value: ref.watch(sentenceCountProvider).toString()),
              _TextDataEntry(
                  label: "paragraphs".tr(),
                  value: ref.watch(paragraphCountProvider).toString()),
              _TextDataEntry(
                  label: "bytes".tr(),
                  value: ref.watch(bytesCountProvider).toString()),
              const SizedBox(
                height: 10,
              ),
              Text("word_distribution".tr(),
                  style: Theme.of(context).textTheme.titleMedium),
              TextFormField(
                controller: wordDistributionController,
                maxLines: 10,
                readOnly: true,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              const SizedBox(
                height: 10,
              ),
              Text("character_distribution".tr(),
                  style: Theme.of(context).textTheme.titleMedium),
              TextFormField(
                controller: characterDistributionController,
                maxLines: 10,
                readOnly: true,
                style: Theme.of(context).textTheme.bodyText2,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _TextDataEntry extends ConsumerWidget {
  final String label;
  final String value;

  const _TextDataEntry({required this.label, required this.value, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodyText2),
        Text(value, style: Theme.of(context).textTheme.bodyText2),
      ],
    );
  }
}
