import 'package:dev_widgets/src/helpers.dart';
import 'package:dev_widgets/src/widgets/io_editor/io_toolbar.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class OutputToolbar extends StatelessWidget {
  final TextEditingController outputController;

  final String? toolbarTitle;
  final List<Widget>? actionButtons;

  const OutputToolbar({
    super.key,
    required this.outputController,
    this.toolbarTitle,
    this.actionButtons,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> actions = [
      ElevatedButton.icon(
        icon: const Icon(Icons.copy),
        label: Text("copy".tr()),
        onPressed: () async => await copyToClipboard(outputController.text),
      )
    ];
    if (actionButtons != null) actions.addAll(actionButtons!);
    return IOToolbar(title: toolbarTitle ?? "output".tr(), actions: actions);
  }
}
