import 'package:code_text_field/code_text_field.dart';
import 'package:dev_widgets/src/impl/helpers.dart';
import 'package:dev_widgets/src/impl/widgets/io_editor/io_editor.dart';
import 'package:dev_widgets/src/impl/widgets/io_editor/io_toolbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';

final outputProvider = StateProvider<String>((ref) => "");

class MarkdownPreviewPage extends ConsumerWidget {
  const MarkdownPreviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return  SizedBox(
            height: MediaQuery.of(context).size.height - kToolbarHeight,
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 1.2,
                child: IOEditor(
                    inputController: CodeController(onChange: (value) {
                      ref.read(outputProvider.notifier).state =
                          applyWebSpaceFix(value);
                    }),
                    outputChild: Column(children: [
                      IOToolbar(title: "preview".tr()),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.5,
                        margin: const EdgeInsets.all(8.0),
                        height: MediaQuery.of(context).size.height / 1.5,
                        child: Consumer(
                            builder: (context, ref, child) =>
                                Markdown(data: ref.watch(outputProvider))),
                      )
                    ])),
              ),
            ));
  }
}
