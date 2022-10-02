import 'package:devtoys/presentation/widgets/io_editor/io_toolbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class OutputToolbar extends StatelessWidget {
  final TextEditingController outputController;

  const OutputToolbar({super.key, required this.outputController});

  @override
  Widget build(BuildContext context) {
    return IOToolbar(title: "output".tr, actions: [
      ElevatedButton.icon(
        icon: Icon(FontAwesomeIcons.copy),
        label: Text("copy".tr),
        onPressed: () async {
          await Clipboard.setData(ClipboardData(text: outputController.text));
        },
      ),
    ]);
  }
}
