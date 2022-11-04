import 'package:dev_widgets/src/impl/helpers.dart';
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

    useEffect(() {
      controller.text = ref.read(convertedCaseProvider);

      controller.addListener(() {
        Future(() {
          ref.read(selectionOffsetProvider.notifier).state =
              controller.selection.baseOffset;

          ref.read(charactersLengthProvider.notifier).state =
              controller.text.characters.length;

          ref.read(inputTextProvider.notifier).state =
              applyWebSpaceFix(controller.text);
        });
      });

      return;
    }, [ref.watch(convertedCaseProvider)]);

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
                  outputChild: const _TextData(),
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
  const _TextData({
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("selection".tr(),
                  style: Theme.of(context).textTheme.titleMedium),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("position".tr(),
                      style: Theme.of(context).textTheme.bodyText1),
                  Text(ref.watch(selectionOffsetProvider).toString(),
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text("statistics".tr(),
                  style: Theme.of(context).textTheme.titleMedium),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("characters".tr(),
                      style: Theme.of(context).textTheme.bodyText1),
                  Text(ref.watch(charactersLengthProvider).toString(),
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
