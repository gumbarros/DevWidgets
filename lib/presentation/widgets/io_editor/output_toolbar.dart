import 'package:devtoys/presentation/widgets/io_editor/io_toolbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

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
        icon: FaIcon(FontAwesomeIcons.copy),
        label: Text("copy".tr),
        onPressed: () async {
          await Clipboard.setData(ClipboardData(text: outputController.text));
        },
      )
    ];
    if (actionButtons != null) actions.addAll(actionButtons!);
    return IOToolbar(title: toolbarTitle ?? "output".tr, actions: actions);
  }
}
