import 'package:dev_widgets/src/impl/text/text_escape/text_escape_providers.dart';
import 'package:dev_widgets/src/models/tools/text/text_escape/escape_conversion_mode.dart';
import 'package:dev_widgets/src/impl/widgets/default_app_bar.dart';
import 'package:dev_widgets/presentation/helpers.dart';
import 'package:dev_widgets/src/impl/widgets/io_editor/io_editor.dart';
import 'package:dev_widgets/src/models/tools/tool.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class TextEscapePage extends ConsumerWidget {
  final Tool tool;

  const TextEscapePage({Key? key, required this.tool}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: DefaultAppBar(title: tool.homeTitle),
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
                        leadingWidget: const Icon(Icons.compare_arrows_sharp),
                        trailingWidget: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: ListTile(
                              title: Text(
                                  StringTranslateExtension("conversion").tr()),
                              subtitle: Text(StringTranslateExtension(
                                      "conversion_description")
                                  .tr())),
                        ),
                        actionWidget: DropdownButton<EscapeConversionMode>(
                            value: ref.watch(escapeConversionModeProvider),
                            items: getDropdownMenuItems<EscapeConversionMode>(
                                EscapeConversionMode.values),
                            onChanged: (selected) {
                              ref
                                      .read(escapeConversionModeProvider.notifier)
                                      .state =
                                  selected ?? EscapeConversionMode.escape;
                            }),
                      )
                    ]),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height / 1.2,
                  child: IOEditor(
                    usesCodeControllers: false,
                    inputController: TextEditingController(),
                    outputController: TextEditingController(),
                    isVerticalLayout: true,
                  )),
            ],
          ),
        ));
  }
}
