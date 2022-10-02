import 'package:devtoys/presentation/widgets/io_editor/io_toolbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class InputToolBar extends StatelessWidget {
  final TextEditingController inputController;

  const InputToolBar({super.key, required this.inputController});

  @override
  Widget build(BuildContext context) {
    return IOToolbar(title: "input".tr, actions: [
      ElevatedButton.icon(
        icon: Icon(FontAwesomeIcons.paste),
        label: Text("paste".tr),
        onPressed: () async {
          inputController.text = await Clipboard.getData("text/plain")
              .then((value) => value?.text ?? "");
        },
      ),
      ElevatedButton.icon(
        icon: Icon(FontAwesomeIcons.copy),
        label: Text("copy".tr),
        onPressed: () async {
          await Clipboard.setData(ClipboardData(text: inputController.text));
        },
      ),
      ElevatedButton.icon(
        icon: Icon(FontAwesomeIcons.xmark),
        label: Text("clear".tr),
        onPressed: () => inputController.clear(),
      ),
    ]);
  }
}
