import 'package:devtoys/presentation/widgets/io_editor/io_toolbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class InputToolBar extends StatelessWidget {
  final TextEditingController inputController;

  final String? toolbarTitle;

  const InputToolBar(
      {super.key, required this.inputController, this.toolbarTitle});

  @override
  Widget build(BuildContext context) {
    return IOToolbar(title: toolbarTitle ?? "input".tr, actions: [
      ElevatedButton.icon(
        icon: FaIcon(FontAwesomeIcons.paste),
        label: Text("paste".tr),
        onPressed: () async {
          inputController.text = await Clipboard.getData("text/plain")
              .then((value) => value?.text ?? "");
        },
      ),
      ElevatedButton.icon(
        icon: FaIcon(FontAwesomeIcons.copy),
        label: Text("copy".tr),
        onPressed: () async {
          await Clipboard.setData(ClipboardData(text: inputController.text));
        },
      ),
      ElevatedButton.icon(
        icon: FaIcon(FontAwesomeIcons.xmark),
        label: Text("clear".tr),
        onPressed: () => inputController.clear(),
      ),
    ]);
  }
}
