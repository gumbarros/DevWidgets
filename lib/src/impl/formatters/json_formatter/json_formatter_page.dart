import 'package:dev_widgets/src/impl/formatters/indentation.dart';
import 'package:dev_widgets/src/impl/formatters/json_formatter/json_formatter_providers.dart';
import 'package:dev_widgets/src/impl/helpers.dart';
import 'package:dev_widgets/src/impl/widgets/io_editor/code_controller_hook.dart';
import 'package:dev_widgets/src/impl/widgets/io_editor/io_editor.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaru_widgets/yaru_widgets.dart';
import 'package:highlight/languages/json.dart';

class JsonFormatterPage extends HookConsumerWidget {
  const JsonFormatterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final inputController = useCodeController(language: json);
    final outputController = useCodeController(language: json);

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
                    leadingWidget: const Icon(Icons.arrow_right_alt),
                    trailingWidget: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "indentation".tr(),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    actionWidget: DropdownButton<Indentation>(
                        value: ref.watch(indentationProvider),
                        items: getDropdownMenuItems<Indentation>(
                            Indentation.values),
                        onChanged: (selected) => ref
                            .read(indentationProvider.notifier)
                            .state = selected!),
                  ),
                  YaruRow(
                    enabled: true,
                    leadingWidget: const Icon(Icons.sort_by_alpha),
                    trailingWidget: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "sort_json_properties_alphabetically".tr(),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    actionWidget: Switch(
                      value: ref.watch(sortAlphabeticallyProvider),
                      onChanged: (value) => ref
                          .read(sortAlphabeticallyProvider.notifier)
                          .state = value,
                    ),
                  )
                ]),
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height / 1.2,
              child: IOEditor(
                inputController: inputController,
                outputController: outputController,
              )),
        ],
      ),
    );
  }
}
