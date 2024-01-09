import 'package:dev_widgets/src/impl/helpers.dart';
import 'package:dev_widgets/src/impl/widgets/io_editor/code_controller_hook.dart';
import 'package:dev_widgets/src/impl/widgets/io_editor/io_editor.dart';
import 'package:dev_widgets/src/impl/widgets/io_editor/io_toolbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:highlight/languages/markdown.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final outputTextProvider = StateProvider<String>((ref) => "");

class MarkdownPreviewPage extends HookConsumerWidget {
  const MarkdownPreviewPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final inputController = useCodeController(language: markdown);

    useEffect(() {
      Future(() {
        inputController.addListener(() {
          ref.read(outputTextProvider.notifier).state =
              applyWebSpaceFix(inputController.text);
        });
      });
      return;
    });

    return SizedBox(
        height: MediaQuery.of(context).size.height - kToolbarHeight,
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 1.2,
            child: IOEditor(
                inputController: inputController,
                outputChild: Column(children: [
                  IOToolbar(title: "preview".tr()),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    margin: const EdgeInsets.all(8.0),
                    height: MediaQuery.of(context).size.height / 1.5,
                    child: Consumer(
                        builder: (context, ref, child) =>
                            Markdown(data: ref.watch(outputTextProvider))),
                  )
                ])),
          ),
        ));
  }
}
