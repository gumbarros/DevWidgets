import 'package:dev_widgets/src/impl/helpers.dart';
import 'package:dev_widgets/src/impl/settings/settings.dart';
import 'package:dev_widgets/src/impl/settings/settings_provider.dart';
import 'package:dev_widgets/src/impl/text/text_diff/text_diff_providers.dart';
import 'package:dev_widgets/src/impl/widgets/io_editor/input_editor.dart';
import 'package:dev_widgets/src/impl/widgets/multi_split_view_divider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:pretty_diff_text/pretty_diff_text.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class TextDiffPage extends HookConsumerWidget {
  const TextDiffPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final settings = ref.watch(settingsProvider);

    final oldTextController = useTextEditingController();
    final newTextController = useTextEditingController();

    useEffect(() {
      Future(() {
        oldTextController.addListener(() {
          ref.read(oldTextProvider.notifier).state =
              applyWebSpaceFix(oldTextController.text);
        });
      });

      return;
    });

    useEffect(() {
      Future(() {
        newTextController.addListener(() {
          ref.read(newTextProvider.notifier).state =
              applyWebSpaceFix(newTextController.text);
        });
      });

      return;
    });

    return SizedBox(
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
                                  ref.read(editCostProvider.notifier).state =
                                      int.tryParse(value) ?? 4;
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
              height: MediaQuery.of(context).size.height / 2.5,
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
                        inputController: oldTextController,
                        minLines: 20,
                        height: MediaQuery.of(context).size.height / 2.5,
                        usesCodeControllers: false),
                    InputEditor(
                        toolbarTitle: "new_text".tr(),
                        minLines: 20,
                        inputController: newTextController,
                        height: MediaQuery.of(context).size.height / 2.5,
                        usesCodeControllers: false),
                  ],
                ),
              )),
          GestureDetector(
            onTap: () {
              showDialog(
                barrierDismissible: true,
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: YaruDialogTitle(
                        closeIconData: Icons.close, title: "difference".tr()),
                    content: _Diff(settings: settings, isDialog: true),
                  );
                },
              );
            },
            child: _Diff(settings: settings),
          ),
        ],
      ),
    );
  }
}

class _Diff extends ConsumerWidget {
  const _Diff({
    required this.settings,
    this.isDialog = false,
  });

  final Settings settings;

  final bool isDialog;

  @override
  Widget build(BuildContext context, ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Visibility(
          visible: !isDialog,
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: const EdgeInsets.all(8.0),
              child: Text("difference".tr(),
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.start),
            ),
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
          height: MediaQuery.of(context).size.height / 1.5,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
              child: PrettyDiffText(
            textAlign: TextAlign.left,
            diffEditCost: ref.watch(editCostProvider),
            diffCleanupType: ref.watch(diffCleanupTypeProvider),
            defaultTextStyle: TextStyle(
                fontSize: ref.watch(settingsProvider).textEditorFontSize,
                textBaseline: TextBaseline.alphabetic,
                fontFamily: settings.textEditorFontFamily,
                color: Theme.of(context).textTheme.bodyLarge!.color),
            newText: ref.watch(newTextProvider),
            oldText: ref.watch(oldTextProvider),
          )),
        )
      ],
    );
  }
}
