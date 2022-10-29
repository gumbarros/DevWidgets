import 'package:dev_widgets/src/impl/widgets/default_app_bar.dart';
import 'package:dev_widgets/src/impl/widgets/io_editor/input_editor.dart';
import 'package:dev_widgets/src/impl/widgets/multi_split_view_divider.dart';
import 'package:dev_widgets/src/impl/settings/settings_provider.dart';
import 'package:dev_widgets/src/impl/text/text_diff/text_diff_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:pretty_diff_text/pretty_diff_text.dart';
import 'package:yaru_widgets/yaru_widgets.dart';
import 'package:easy_localization/easy_localization.dart';

class TextDiffPage extends ConsumerWidget {
  const TextDiffPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
        appBar: DefaultAppBar(title: "text_diff".tr()),
        body: SizedBox(
          height: MediaQuery.of(context).size.height - kToolbarHeight,
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.all(8.0),
                child: YaruSection(
                    headline: StringTranslateExtension("configuration").tr(),
                    children: [
                      RadioListTile<DiffCleanupType>(
                          title: Text("semantic_cleanup".tr()),
                          subtitle: Text("semantic_cleanup_description".tr()),
                          value: DiffCleanupType.SEMANTIC,
                          groupValue: ref.watch(diffCleanupTypeProvider),
                          onChanged: (DiffCleanupType? value) {
                            ref.read(diffCleanupTypeProvider.notifier).state =
                                value ?? DiffCleanupType.EFFICIENCY;
                          }),
                      RadioListTile(
                          title: Row(
                            children: [
                              Text(
                                  "${"efficiency_cleanup".tr()}.${"edit_cost".tr()}:"),
                              SizedBox(
                                  width: 40,
                                  height: 30,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    onChanged: (value) {
                                      ref
                                          .read(editCostProvider.notifier)
                                          .state = int.tryParse(value) ?? 4;
                                    },
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.all(5),
                                      border: OutlineInputBorder(),
                                    ),
                                  ))
                            ],
                          ),
                          subtitle: Text("efficiency_cleanup_description".tr()),
                          value: DiffCleanupType.EFFICIENCY,
                          groupValue: ref.watch(diffCleanupTypeProvider),
                          onChanged: (DiffCleanupType? value) {
                            ref.read(diffCleanupTypeProvider.notifier).state =
                                value ?? DiffCleanupType.EFFICIENCY;
                          }),
                      RadioListTile(
                          title: Text("no_cleanup".tr()),
                          subtitle: Text("no_cleanup_description".tr()),
                          value: DiffCleanupType.NONE,
                          groupValue: ref.watch(diffCleanupTypeProvider),
                          onChanged: (DiffCleanupType? value) {
                            ref.read(diffCleanupTypeProvider.notifier).state =
                                value ?? DiffCleanupType.EFFICIENCY;
                          }),
                    ]),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  child: MultiSplitViewTheme(
                    data: MultiSplitViewThemeData(dividerThickness: 5),
                    child: MultiSplitView(
                      dividerBuilder: (axis, index, resizable, dragging,
                              highlighted, themeData) =>
                          MultiSplitViewDivider(
                              dragging: dragging, highlighted: highlighted),
                      axis: Axis.horizontal,
                      initialAreas: [
                        Area(weight: 0.5, minimalWeight: 0.3),
                        Area(weight: 0.5, minimalWeight: 0.3)
                      ],
                      children: [
                        InputEditor(
                            toolbarTitle: "old_text".tr(),
                            inputController:
                                ref.read(oldTextControllerProvider),
                            height: MediaQuery.of(context).size.height / 3,
                            usesCodeControllers: false),
                        InputEditor(
                            toolbarTitle: "new_text".tr(),
                            inputController:
                                ref.read(newTextControllerProvider),
                            height: MediaQuery.of(context).size.height / 3,
                            usesCodeControllers: false),
                      ],
                    ),
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      child: Text("difference".tr(),
                          style: Theme.of(context).textTheme.titleMedium,
                          textAlign: TextAlign.start),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).disabledColor,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                        child: PrettyDiffText(
                      textAlign: TextAlign.left,
                      diffEditCost: ref.watch(editCostProvider),
                      diffCleanupType: ref.watch(diffCleanupTypeProvider),
                      defaultTextStyle: TextStyle(
                          fontSize:
                              ref.watch(settingsProvider).textEditorFontSize,
                          textBaseline: TextBaseline.alphabetic,
                          fontFamily:
                              ref.watch(settingsProvider).textEditorFontFamily,
                          color: Theme.of(context).textTheme.bodyText1!.color),
                      newText: ref.watch(newTextProvider),
                      oldText: ref.watch(oldTextProvider),
                    )),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
