import 'package:dev_widgets/src/impl/text/text_escape/text_escape_providers.dart';
import 'package:dev_widgets/src/impl/text/text_escape/escape_conversion_mode.dart';
import 'package:dev_widgets/src/impl/helpers.dart';
import 'package:dev_widgets/src/impl/widgets/io_editor/io_editor.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class TextEscapePage extends HookConsumerWidget {
  const TextEscapePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputController = useTextEditingController();
    final outputController = useTextEditingController();

    useEffect(() {
      Future(() {
        inputController.addListener(() {
          ref.read(inputTextProvider.notifier).state = inputController.text;
        });
      });

      return;
    });

    useEffect(() {
      Future(() {
        try {
          outputController.text = ref.watch(outputTextProvider);
        } catch (_) {
          //Bug on text_code_field package.
        }
      });
      return;
    }, [ref.watch(outputTextProvider)]);

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
                    leadingWidget: const Icon(Icons.compare_arrows_sharp),
                    trailingWidget: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: ListTile(
                          title:
                              Text(StringTranslateExtension("conversion").tr()),
                          subtitle: Text("conversion_mode".tr())),
                    ),
                    actionWidget: DropdownButton<EscapeConversionMode>(
                        value: ref.watch(escapeConversionModeProvider),
                        items: getDropdownMenuItems<EscapeConversionMode>(
                            EscapeConversionMode.values),
                        onChanged: (selected) {
                          ref
                              .read(escapeConversionModeProvider.notifier)
                              .state = selected ?? EscapeConversionMode.escape;
                        }),
                  )
                ]),
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height / 1.2,
              child: IOEditor(
                usesCodeControllers: false,
                inputController: inputController,
                outputController: outputController,
                isVerticalLayout: true,
              )),
        ],
      ),
    );
  }
}
